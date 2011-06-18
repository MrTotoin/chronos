class PaginasController < ApplicationController
  def home
    @title = "Home"
  end

  def configuraciones
    @title = "Configuraciones"
  end

  def about
    @title = "About"
  end

end
