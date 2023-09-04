# frozen_string_literal: true

class BorrowersController < ApplicationController
  def index
    @borrowers = Borrower.all
    render json: @borrowers
  end

  def show
    @borrower = Borrower.find(params[:id])
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      render plain: 'borrower succesfully added'
    else
      render :new, status: 422
    end
  end

  def edit
    @borrower = Borrower.find(params[:id])
  end

  def update
    @borrower = Borrower.find(params[:id])

    if @borrower.update(borrower_params)
      render plain: 'borrower update succesfully added'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @borrower = Borrower.find(params[:id])
    @borrower.destroy

    render plain: 'borrower deleted succesfully '
  end

  private

  def borrower_params
    params.permit(:name, :contact_info)
  end
end
