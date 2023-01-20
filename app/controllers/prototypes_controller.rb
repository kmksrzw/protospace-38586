class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
 


  def index
    @prototype = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    # if Prototype.create(prototype_params)
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to  root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    # unless user_signed_in?
      # redirect_to  action: :index
    # end
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    # prototype.update(prototype_params)
    if @prototype.update(prototype_params)  
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  
  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      # redirect_to  root_path
      redirect_to  action: :index
    end
  end
  
end