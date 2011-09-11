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

def nadadores_partida
  nadadores@partida.nadador_id_1
end


end
