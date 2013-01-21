class IsiboxController < ApplicationController
  def index
    @usuario=session[:usuario]
  end

  def create
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
