class IsiboxController < ApplicationController
  def index
    @usuario=Usuario.find_by_nick(session[:usuario])
    @files=@usuario.fichero_gestionados
    
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

  def download
    @file=FicheroGestionado.find_by_id(params[:id])
    puts @file.file
    send_file "public/#{@file.file}"
  end
end
