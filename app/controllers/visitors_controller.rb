class VisitorsController < ApplicationController

  def about
  end

  def index
    @questions = Question.randomized.shuffle
  end
end
