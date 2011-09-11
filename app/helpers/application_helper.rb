module ApplicationHelper
  def title       #metodo para el titulo de la pagina
    base_title = "Chronos"
    if @title.nil?
        base_title
    else
      "#{base_title} - #{@title}"
    end
  end
  
  def print_tiempo (tiempo)
    if tiempo==nil
      return "00 : 00 : 000"
    end
    @sec = (tiempo/1000).to_i
    @ms = (tiempo - (@sec*1000)).to_i
    if @sec>=60
      @min = (@sec/60).to_i
      @sec = @sec-(@min*60)
      return "#{@min} : #{@sec} : #{@ms}"
    else
      return "#{@sec} : #{@ms}"
    end  
  end
  
  
end
