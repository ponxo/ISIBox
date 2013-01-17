class SessionsController < ApplicationController

  def login
    @nick=params[:usuario][:nick]
    @password=params[:usuario][:password]
    @user=Usuario.find_by_nick(@nick)
    if @user then
      if @user.password == @password then
        session[:usuario]=@user
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
    @usuario=Usuario.create(params[:usuario])
    if @usuario then
      session[:usuario]=@usuario
      redirect_to isibox_index_path
    else
      flash[:warning]="Fallo en el registro"
      redirect_to registro_path
    end
  end

end
