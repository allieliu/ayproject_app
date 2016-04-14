class ProbsController < ApplicationController

  def index
  end

  def new
    @prob = Prob.new
  end

  def edit
  end

  def create
    @prob = Prob.new

    if @prob.save
      redirect_to prob_path
    else
      render :new
    end
  end

end
