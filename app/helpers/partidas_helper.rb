module PartidasHelper

def mejor_tiempo 
  /@tiempo=@partida.tiempo_1
  if @partida.tiempo_2 != nil && @partida.nadador_id_2 != nil
    if @partida.tiempo_2 < @tiempo then  @tiempo=@partida.tiempo_2 end 
  end
  if @partida.tiempo_3 != nil && @partida.nadador_id_3 != nil
    if @partida.tiempo_3 < @tiempo then  @tiempo=@partida.tiempo_3 end
  end
  if @partida.tiempo_4 != nil && @partida.nadador_id_4 != nil
    if @partida.tiempo_4 < @tiempo then  @tiempo=@partida.tiempo_4 end
  end
  if @partida.tiempo_5 != nil && @partida.nadador_id_5 != nil
    if @partida.tiempo_5 < @tiempo then  @tiempo=@partida.tiempo_5 end
  end
  if @partida.tiempo_6 != nil && @partida.nadador_id_6 != nil
    if @partida.tiempo_6 < @tiempo then  @tiempo=@partida.tiempo_6 end
  end
  if @partida.tiempo_7 != nil && @partida.nadador_id_7 != nil
    if @partida.tiempo_7 < @tiempo then  @tiempo=@partida.tiempo_7 end
  end
  if @partida.tiempo_8 != nil && @partida.nadador_id_8 != nil
    if @partida.tiempo_8 < @tiempo then  @tiempo=@partida.tiempo_8 end
  end
/
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
