# frozen_string_literal: true

class Borrowing < ApplicationRecord
  belongs_to :book
  belongs_to :borrower
  has_many :notes, as: :notable

  validates :return_date, presence: true, if: :returned?
  validates_associated :book, :borrower
end
