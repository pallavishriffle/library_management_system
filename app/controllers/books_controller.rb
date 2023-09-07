# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: { message:"Book Added!!", data: @book }
    else
      render json: { errors: @book.errors.full_messages }
    end
  end

  
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      render json: { message:"Book Update!!", data: @book }
    else
      render json: { errors: @book.errors.full_messages }
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    render json: { message:"Book Deleted!!", data: @book }
  end

  private

  def book_params
    params.permit(:title, :author, :publication_year, :availability)
  end
end
