module PartidasHelper

def mejor_tiempo
#  return @tiempo
  @tiempo=@partida.tiempo_1.to_f
  if @partida.tiempo_2.to_f != 0.to_f 
    if @partida.tiempo_2 < @tiempo then  @tiempo=@partida.tiempo_2.to_f end 
  end
  if @partida.tiempo_3.to_f != 0.to_f 
    if @partida.tiempo_3.to_f < @tiempo then  @tiempo=@partida.tiempo_3.to_f end
  end
  if @partida.tiempo_4.to_f != 0 
    if @partida.tiempo_4.to_f < @tiempo then  @tiempo=@partida.tiempo_4.to_f end
  end
  if @partida.tiempo_5.to_f != 0
    if @partida.tiempo_5.to_f < @tiempo then  @tiempo=@partida.tiempo_5.to_f end
  end
  if @partida.tiempo_6.to_f != 0.to_f
    if @partida.tiempo_6.to_f < @tiempo then  @tiempo=@partida.tiempo_6.to_f end
  end
  if @partida.tiempo_7.to_f != 0.to_f 
    if @partida.tiempo_7.to_f < @tiempo then  @tiempo=@partida.tiempo_7.to_f end
  end
  if @partida.tiempo_8.to_f != 0.to_f 
    if @partida.tiempo_8.to_f < @tiempo then  @tiempo=@partida.tiempo_8.to_f end
  end
#  if @tiempo==0 
#    return  0
#  end
  
  return @tiempo
end

def ganador 
  @ganador=@partida.nadador_id_1
  @tiempo=@partida.tiempo_1.to_f
  if @partida.tiempo_2.to_f != 0.to_f 
    if @partida.tiempo_2 < @tiempo then  @tiempo=@partida.tiempo_2.to_f @ganador=@partida.nadador_id_2 end 
  end
  if @partida.tiempo_3.to_f != 0.to_f 
    if @partida.tiempo_3.to_f < @tiempo then  @tiempo=@partida.tiempo_3.to_f @ganador=@partida.nadador_id_3 end
  end
  if @partida.tiempo_4.to_f != 0 
    if @partida.tiempo_4.to_f < @tiempo then  @tiempo=@partida.tiempo_4.to_f @ganador=@partida.nadador_id_4 end
  end
  if @partida.tiempo_5.to_f != 0
    if @partida.tiempo_5.to_f < @tiempo then  @tiempo=@partida.tiempo_5.to_f @ganador=@partida.nadador_id_5 end
  end
  if @partida.tiempo_6.to_f != 0.to_f
    if @partida.tiempo_6.to_f < @tiempo then  @tiempo=@partida.tiempo_6.to_f @ganador=@partida.nadador_id_6 end
  end
  if @partida.tiempo_7.to_f != 0.to_f 
    if @partida.tiempo_7.to_f < @tiempo then  @tiempo=@partida.tiempo_7.to_f @ganador=@partida.nadador_id_7 end
  end
  if @partida.tiempo_8.to_f != 0.to_f 
    if @partida.tiempo_8.to_f < @tiempo then  @ganador=@partida.nadador_id_8 end
  end
#  if @tiempo==0 
#    return  0
#  end
  
  return @ganador
end

def nadadores_partida
  nadadores@partida.nadador_id_1
end


end
