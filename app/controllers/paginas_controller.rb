class PaginasController < ApplicationController
  def home
    @title = "Home"
  end
  def nadadores
    @title = "Nadadores"
  end
  
  def entrenamientos
     @title = "Entrenamientos"
  end
  
  def competencias
      @title = "Competencias"
  end

  def configuraciones
    @title = "Configuraciones"
  end

  def about
    @title = "About"
  end

end
