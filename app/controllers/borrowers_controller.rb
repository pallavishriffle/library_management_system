# frozen_string_literal: true

class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.all
    render json: @borrowers
  end

  def show
    @borrower = Borrower.find(params[:id])
  end

  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      render json: { message:"Borrower Added!!", data: @borrower }
    else
      render json: { errors: @borrower.errors.full_messages }
    end
  end

  def update
    @borrower = Borrower.find(params[:id])

    if @borrower.update(borrower_params)
      render json: { message:"borrower update succesfully!!", data: @borrower }
    else
      render json: { errors: @borrower.errors.full_messages }
    end
  end

  def destroy
    @borrower = Borrower.find(params[:id])
    @borrower.destroy
    render json: { message:"Borrower Deleted!!", data: @book }
  end

  private

  def borrower_params
    params.permit(:name, :contact_info)
  end
end
