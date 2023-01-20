class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @prototype = Prototype.search(params[:user_id])
    @prototype = @user.prototypes
  end

end
