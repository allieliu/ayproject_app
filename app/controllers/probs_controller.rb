class ProbsController < ApplicationController



  def index
    @probs = Prob.all
  end

  def new
    @prob = Prob.new
  end

  def edit
    @prob = Prob.find(params[:id])
  end

  def update
    @prob = Prob.find(params[:id])
    if @prob.update_attributes(prob_params)
      redirect_to prob_path(@prob)
    else
      render :edit
    end
  end


  def show
    @prob = Prob.find(params[:id])
  end

  def create
    @prob = Prob.new(prob_params)

    if @prob.save
      redirect_to prob_path(@prob.id)
    else
      render :new
    end
  end

  def destroy
    @prob = Prob.find(params[:id])
    @prob.destroy
    redirect_to probs_path
  end

private

  def prob_params
    params.require(:prob).permit(:word, :definition)
  end

end
