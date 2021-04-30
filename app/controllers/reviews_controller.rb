class ReviewsController < ApplicationController
  before_action :set_list, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end
end
