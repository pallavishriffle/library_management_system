# frozen_string_literal: true

class BorrowingsController < ApplicationController
  def index
    @borrowings = Borrowing.all
    render json: @borrowings
  end

  def create
    @borrowing = Borrowing.new(borrowing_params)
    if @borrowing.save
      render json: { message:"Borrowing Added!!", data: @borrowing }
    else
      render json: { errors: @borrowing.errors.full_messages }
    end
  end

  def show
    @borrowing = Borrowing.find(params[:id])
  end


  def update
    @borrowing = Borrowing.find(params[:id])

    if @borrowing.update(borrowing_params)
      render json: { message:"Borrowing updated!!", data: @borrowing }
    else
      render json: { errors: @borrowing.errors.full_messages }
    end
  end

  def destroy
    @borrowing = Borrowing.find(params[:id])
    @borrowing.destroy
    render json: { message:"Borrowing Deleted!!", data: @borrowing }
  end

  private

  def borrowing_params
    params.permit(:book_id, :borrower_id, :return_date, :returned)
  end
end
