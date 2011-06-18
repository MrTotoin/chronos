module ApplicationHelper
  def title       #metodo para el titulo de la pagina
    base_title = "Chronos"
    if @title.nil?
        base_title
    else
      "#{base_title} - #{@title}"
    end
  end
  
end
