class ProbsController < ApplicationController



  def index
    @user = User.find(session[:user_id])
    @probs = Prob.all
  end

  def new
    @user = User.find(session[:user_id])
    @prob = Prob.new
  end

  def edit
    @user = User.find(session[:user_id])
    @prob = Prob.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @prob = Prob.find(params[:id])
    if @prob.update_attributes(prob_params)
      redirect_to prob_path(@prob)
    else
      render :edit
    end
  end

  def show
    @user = User.find(session[:user_id])
    @prob = Prob.find(params[:id])
  end

  def create
    @user = User.find(session[:user_id])
    @prob = @user.probs.new(prob_params)

    if @prob.save
      redirect_to prob_path(@prob.id)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @prob = Prob.find(params[:id])
    @prob.destroy
    redirect_to probs_path
  end

private

  def prob_params
    params.require(:prob).permit(:word, :definition)
  end

end
