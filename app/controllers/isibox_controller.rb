class IsiboxController < ApplicationController
  def index
    @usuario=Usuario.find_by_nick(session[:usuario])
    @files=@usuario.fichero_gestionados
    puts 'Voy a poner la cantidad de ficheros aqui que tiene subidos cada uno'
    puts @files.length
    
  end

  def create
    @usuario=Usuario.find_by_nick(session[:usuario])
    @usuario.fichero_gestionados.build(params[:fichero])
    if @usuario.save then
      flash[:notice]="Archivo subido satisfactoriamente"
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
