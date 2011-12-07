/*******************************************************************************
La idea es tomar la plantilla virgen y agregarle los nuevos datos.
En este caso, lo nuevos datos vendran desde un archivo de texto plano, el cual
vamos a leer de a un byte para simular la lectura de un byte desde puerto 
serie.
*******************************************************************************/

#include<stdio.h>
#include"com/serielinux.h"
#include<fcntl.h>
#include<unistd.h>

#define __LINUX_COM__

#define	ENTER		10
#define	OK		0
#define	NOK		1
#define TAM_BUFF	9
#define NUM_BYTES	8
#define START		'S'
#define CONTINUE	'C'

int menu(void);
int descargar(void);
void abrir_hoja_calculo(void);
void borrar_datos(void);
void instrucciones(void);

FILE *src,*dst;
unsigned char aux,r_aux,I,laps,hab_andrv[8],archivo_datos[]="buffer_Rx.txt",archivo_laps[]="buffer_Tx.txt";
unsigned char buffer[TAM_BUFF];
int salir;
HANDLE fd;
DCB old_conf;



int main(void)
{

salir=descargar();
return 0;
}
/******************************************************************************/
//Nombre: descargar.
//Parametros: ninguno
//Devuelve: entero
//
//Funcion: se encarga de crear un nuevo archivo de datos del tipo csv con los 
//datos provenientes de la plataforma. Ademas copia en este nuevo archivo el 
//contenido de otro archivo llamado p_virgen.cvs, el cual contiene la plantilla
//base.Por ultimo añade los datos obtenidos de la plataforma. 
//
//
/******************************************************************************/

int descargar(void)
{
int n;
dst=fopen(archivo_datos,"w");				//Creo el nuevo archivo con el nombre dado
if(!dst)
	{
	printf("\nError dst\n");
	return 0;
	}
fclose(dst);						//Lo cierro
fd=Open_Port("/dev/ttyACM0");				//abro el puerto usb
if(fd==-1)
	{
	return 0;
	}
	old_conf=Get_Configure_Port(fd);		//guardo la configuracion actual
Configure_Port(fd,B9600,"8N1");				//establesco mi configuracion
//fcntl(fd, F_SETFL, O_NONBLOCK);
printf("\nEsperando datos...\n");
//Abro, guardo y cierro
dst=fopen(archivo_datos,"r+");				//abro el archivo de intercambio
src=fopen(archivo_laps,"r+");				//abro el archivo de intercambio

fread(&aux,sizeof(unsigned char),1,src);		//leo numero de laps
laps=aux;
for(n=0;n<8;n++)
	{
	fread(&aux,sizeof(unsigned char),1,src);	//El primer caracter es un salto de linea, lo descarto.
	fread(&aux,sizeof(unsigned char),1,src);	//Leo el estado de habilitacion del andarivel
	hab_andrv[n]=aux;
	}
fclose(src);						//Cierro
if(!dst)						//Si hay algun error lo notifico y salgo del programa
	{
	printf("\nError dst\n");
	return 0;
	}
//ENVIO NUMERO DE LAPS y ESTADO DE HABILITACION DE ANDARIVELES
Write_Port(fd,&laps,1);
while(aux!=CONTINUE)
	{
	Read_Port(fd,&aux,1);
	}
aux=0;
Write_Port(fd,hab_andrv,8);
while(aux!=CONTINUE)
	{
	Read_Port(fd,&aux,1);
	}
for(n=0;n<9;n++)
	{
	aux=START;
	Write_Port(fd,&aux,1);
	Read_Port(fd,buffer,NUM_BYTES);			//Leo el puerto y guardo lo recibido en buffer
	if(buffer[2]=='S')
		{
		buffer[0]='D';
		}
	if(buffer[0]==NULL)
		{
		buffer[0]='0';
		}
	fwrite(buffer,sizeof(unsigned char),NUM_BYTES,dst);	//Guardo
	aux=ENTER;
	fwrite(&aux,sizeof(unsigned char),1,dst);		//Guardo
	}
//Recibo el los 8 bytes con las posiciones
aux=START;
Write_Port(fd,&aux,1);
Read_Port(fd,buffer,NUM_BYTES);				//Leo el puerto y guardo lo recibido en buffer
for(n=0;n<8;n++)
	{
	fwrite(&buffer[n],sizeof(unsigned char),1,dst);		//Guardo
	aux=ENTER;
	fwrite(&aux,sizeof(unsigned char),1,dst);		//Guardo
	}

fclose(dst);						//Cierro
Set_Configure_Port(fd,old_conf);			//reestablezco configuracion
Close_Port(fd);						//cierro puerto usb
printf("\nDatos recibidos correctamente. \n");
fflush(stdin);
return 0;
}

