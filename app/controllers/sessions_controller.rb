class SessionsController < ApplicationController

  def login
    @nick=params[:usuario][:nick]
    @password=params[:usuario][:password]
    @user=Usuario.find_by_nick(@nick)
    if @user then
      if @user.password == @password then
        session[:usuario]=@user.nick
        redirect_to isibox_index_path
      else
        flash[:warning]="Fallo de autenticacion"
        redirect_to homepage_path
      end
    else
      flash[:warning]="Fallo de autenticacion"
      redirect_to homepage_path
    end
  end

  def create
    if params[:usuario][:password]==params[:repeticion][:password_2] then
      @usuario=Usuario.create(params[:usuario])
      if @usuario then
        session[:usuario]=@usuario.nick
        redirect_to isibox_index_path
      else
        flash[:warning]="Fallo en el registro"
        redirect_to registro_path
      end
    else
      flash[:warning]="Fallo en el registro, introduce el mismo password"
      redirect_to registro_path 
    end
  end

  def destroy
    if session.delete(:usuario) then
      flash[:notice]="Log Out correctamente"
      redirect_to homepage_path
    else
      flash[:warning]="Fallo del log out, vuelva a intentarlo"
      return
    end

  end

  def borrar
    @usuario=Usuario.find_by_id(params[:id])
    @files=@usuario.fichero_gestionados
    @numeros=Array.new
    @files.each do |file|
      @numeros << "#{file.id}"
    end
    session.delete(:usuario)
    if @usuario.destroy then
      @numeros.each do |id|
        Dir.rmdir("public/uploads/fichero_gestionado/file/#{id}")
      end
      flash[:notice]="Usuario eliminado"
      redirect_to homepage_path
    else
      flash[:warning]="No se pudo eliminar el usuario. Vuelva a intentarlo"
      redirect_to isibox_index_path
    end
  end

end
