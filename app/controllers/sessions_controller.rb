class SessionsController < ApplicationController

  def login
    @nick=params[:usuario][:Nick]
    @password=params[:usuario][:password]
    @user=Usuario.find_by_nick(@nick)
    if @user then
      if @user.password == @password then
        session[:usuario]=@user
        redirect _to isibox_index_path
      end
      else
        flash[:warning]="Fallo de autenticacion"
        redirect_to homepage_path
      end
    end
    else
      flash[:warning]="Fallo de autenticacion"
      redirect_to homepage_path
    end
  end

end
