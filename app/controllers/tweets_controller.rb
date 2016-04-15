class TweetsController < ApplicationController

before_action :create_client

#  def index
#     batch_size = 10
#     @twitter_handle = "dhh"
#     @tweets = @client.user_timeline(@twitter_handle).take(batch_size)
# end

def index
  @probs= Prob.all
end

def show
end

def new
  @Prob.new
end

def create
  @Prob.new(prob_params)

  if @prob.save
    redirect_to prob_path(@prob)
  else
    render :new
  end
end

def edit
end

def update
    if @prob.update_attributes(prob_params)
      redirect_to prob_path
    else

end
