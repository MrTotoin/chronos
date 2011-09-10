module PartidasHelper

def mejor_tiempo
  @tiempo=@partida.tiempo_1
  if @partida.tiempo_2 != nil 
    if @partida.tiempo_2 < @tiempo then  @tiempo=@partida.tiempo_2 end 
  end
  if @partida.tiempo_3 != nil 
    if @partida.tiempo_3 < @tiempo then  @tiempo=@partida.tiempo_3 end
  end
  if @partida.tiempo_4 != nil 
    if @partida.tiempo_4 < @tiempo then  @tiempo=@partida.tiempo_4 end
  end
  if @partida.tiempo_5 != nil
    if @partida.tiempo_5 < @tiempo then  @tiempo=@partida.tiempo_5 end
  end
  if @partida.tiempo_6 != nil
    if @partida.tiempo_6 < @tiempo then  @tiempo=@partida.tiempo_6 end
  end
  if @partida.tiempo_7 != nil 
    if @partida.tiempo_7 < @tiempo then  @tiempo=@partida.tiempo_7 end
  end
  if @partida.tiempo_8 != nil 
    if @partida.tiempo_8 < @tiempo then  @tiempo=@partida.tiempo_8 end
  end
  
  return @tiempo
end

def nadadores_partida
  nadadores@partida.nadador_id_1
end

end
