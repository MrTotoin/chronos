module PartidasHelper

def mejor_tiempo
  if @partida.nadador_id_1 != nil && @partida.puesto_nadador_1 == 1
    @tiempo = @partida.tiempo_1  
  elsif @partida.nadador_id_2 !=nil && @partida.puesto_nadador_2 == 1
    @tiempo = @partida.tiempo_2  
  elsif @partida.nadador_id_3 !=nil && @partida.puesto_nadador_3 == 1
    @tiempo = @partida.tiempo_3  
  elsif @partida.nadador_id_4 !=nil && @partida.puesto_nadador_4 == 1
    @tiempo = @partida.tiempo_4  
  elsif @partida.nadador_id_5 !=nil && @partida.puesto_nadador_5 == 1
    @tiempo = @partida.tiempo_5  
  elsif @partida.nadador_id_6 !=nil && @partida.puesto_nadador_6 == 1
    @tiempo = @partida.tiempo_6  
  elsif @partida.nadador_id_7 !=nil && @partida.puesto_nadador_7 == 1
    @tiempo = @partida.tiempo_7  
  elsif @partida.nadador_id_8 !=nil && @partida.puesto_nadador_8 == 1
    @tiempo = @partida.tiempo_8  
  end
  if @tiempo==nil
    return "Error al buscar el mejor tiempor"
  end
  
  return @tiempo
end

def ganador 
  if @partida.nadador_id_1 != nil && @partida.puesto_nadador_1 == 1
    @ganador = @partida.nadador_id_1  
  elsif @partida.nadador_id_2 !=nil && @partida.puesto_nadador_2 == 1
    @ganador=@partida.nadador_id_2
  elsif @partida.nadador_id_3 !=nil && @partida.puesto_nadador_3 == 1
    @ganador=@partida.nadador_id_3
  elsif @partida.nadador_id_4 !=nil && @partida.puesto_nadador_4 == 1
    @ganador=@partida.nadador_id_4
  elsif @partida.nadador_id_5 !=nil && @partida.puesto_nadador_5 == 1
    @ganador=@partida.nadador_id_5
  elsif @partida.nadador_id_6 !=nil && @partida.puesto_nadador_6 == 1
    @ganador=@partida.nadador_id_6 
  elsif @partida.nadador_id_7 !=nil && @partida.puesto_nadador_7 == 1
    @ganador=@partida.nadador_id_7
  elsif @partida.nadador_id_8 !=nil && @partida.puesto_nadador_8 == 1
    @ganador=@partida.nadador_id_8 
  end
  if @ganador==nil
    return "Error al buscar al ganador"
  end
  
  return "#{Nadador.find(@ganador).apellido}, #{Nadador.find(@ganador).nombre}"
end




def nadadores_partida
  nadadores@partida.nadador_id_1
end


end
