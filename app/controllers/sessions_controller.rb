class SessionsController < ApplicationController

  def create
    @user = from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
    redirect_to "/user"
  end

  private
  def from_omniauth(auth_hash)
    user = User.new(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = auth_hash['info']['urls']['Twitter']
    user.save!
    user
  end

end
