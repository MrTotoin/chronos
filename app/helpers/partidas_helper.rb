module PartidasHelper

def mejor_tiempo
/  @partidas.each do |partida|
    @partida_actual = partida.partida_id
    if (@partida_actual==partida) 
      if (partida.tiempo < @tiempo)
        @tiempo = partida.tiempo
      end
    else
      return @tiempo
    end
  end/
  @tiempo=3444
end

end
