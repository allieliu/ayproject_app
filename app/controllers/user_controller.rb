class UserController < ApplicationController

class << self
  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = auth_hash['info']['urls']['Twitter']
    user.save!
    user
  end
end

def new
  @self= Self.new
end

def show
  redirect_to('/') unless session[:uid]
end


  def update
    user = User.find_by(id: params[:id])
    user.update(user_params)
    redirect_to profile_path
  end


end
