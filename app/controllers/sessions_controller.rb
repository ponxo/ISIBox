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

end
