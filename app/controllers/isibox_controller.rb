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
    @file=FicheroGestionado.find_by_id(params[:id])
    @type=@file.content_type
    if @type=='Audio'
      render :template => 'isibox/audio.html.haml'
    elsif @type=='Imagen'
      render :template => 'isibox/imagen.html.haml'
    elsif @type=='Video'
      render :template => 'isibox/video.html.haml'
    elsif @type=='Texto'
      puts @type
    else
      flash[:warning]="No se puede reproducir el archivo online"
      redirect_to isibox_index_path
    end
  end

  def update
  end

  def destroy
    @file=FicheroGestionado.find_by_id(params[:id])
    if @file.destroy then
      Dir.rmdir("public/uploads/fichero_gestionado/file/#{@file.id}")
      flash[:notice]="Archivo Eliminado"
    else
      flash[:warning]="No se pudo eliminar el archivo, vuelva a intentarlo"
    end
    redirect_to isibox_index_path

  end

  def download
    @file=FicheroGestionado.find_by_id(params[:id])
    send_file "public/#{@file.file}"
  end
end
