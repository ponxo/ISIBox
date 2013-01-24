class IsiboxController < ApplicationController
  def index
    @usuario=session[:usuario]
  end

  def create
    @usuario=Usuario.find_by_nick(session[:usuario])
    puts params[:fichero]
    @usuario.fichero_gestionados.build(params[:fichero])
    if @usuario.save then
      redirect_to isibox_index_path
    else
      flash[:warning]="Fallo al subir el archivo"
      return
    end
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
