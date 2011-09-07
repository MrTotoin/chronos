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
      @competencias = Competencia.find(:all)
  end

  def configuraciones
    @title = "Configuraciones"
  end

  def about
    @title = "About"
  end

end
