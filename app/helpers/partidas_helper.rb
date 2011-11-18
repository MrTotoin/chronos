module PartidasHelper

def mejor_tiempo 
  @tiempo=@partida.tiempo_1
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
  
  return @tiempo
end

def ganador 
  @ganador=@partida.nadador_id_1
  @tiempo=@partida.tiempo_1
  if @partida.tiempo_2 != 0 && @partida.nadador_id_2 != nil
    if @partida.tiempo_2 < @tiempo then  @tiempo=@partida.tiempo_2 @ganador=@partida.nadador_id_2 end 
  end
  if @partida.tiempo_3 != 0 && @partida.nadador_id_3 != nil
    if @partida.tiempo_3 < @tiempo then  @tiempo=@partida.tiempo_3 @ganador=@partida.nadador_id_3 end
  end
  if @partida.tiempo_4 != 0 && @partida.nadador_id_4 != nil
    if @partida.tiempo_4 < @tiempo then  @tiempo=@partida.tiempo_4 @ganador=@partida.nadador_id_4 end
  end
  if @partida.tiempo_5 != 0 && @partida.nadador_id_5 != nil
    if @partida.tiempo_5 < @tiempo then  @tiempo=@partida.tiempo_5 @ganador=@partida.nadador_id_5 end
  end
  if @partida.tiempo_6 != 0 && @partida.nadador_id_6 != nil
    if @partida.tiempo_6 < @tiempo then  @tiempo=@partida.tiempo_6 @ganador=@partida.nadador_id_6 end
  end
  if @partida.tiempo_7 != 0 && @partida.nadador_id_7 != nil 
    if @partida.tiempo_7 < @tiempo then  @tiempo=@partida.tiempo_7 @ganador=@partida.nadador_id_7 end
  end
  if @partida.tiempo_8 != 0 && @partida.nadador_id_8 != nil
    if @partida.tiempo_8 < @tiempo then  @ganador=@partida.nadador_id_8 end
  end
  
  return @ganador
end




def nadadores_partida
  nadadores@partida.nadador_id_1
end


end
