class SessionsController < ApplicationController

  def login
    @nick=params[:usuario][:Nick]
    @password=params[:usuario][:Password]
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

end
