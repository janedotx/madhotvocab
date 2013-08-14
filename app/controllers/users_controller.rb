class UsersController < ApplicationController
  def reset_life
    @user.reset_life
    render :json => { :lives => @user.lives }
  end

  def lose_life
    @user.lose_life
    render :json => {:lives =>  @user.lives }
  end

  def num_lives
    render :json => {:lives =>  @user.lives }
  end
end
