class IsiboxController < ApplicationController
  def index
    @usuario=session[:usuario]
  end

  def create
    @usuario=Usuario.find_by_nick(session[:usuario])
    puts params[:fichero]
    @usuario.fichero_gestionados.build(params[:fichero])
    @usuario.save
    redirect_to isibox_index_path
  end

  def new
  end
 
  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
