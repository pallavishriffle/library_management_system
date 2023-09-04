# frozen_string_literal: true

require_relative 'validates'
class Book < ApplicationRecord
  has_many :borrowings
  has_many :notes, as: :notable

  validates_with BookValidator
  before_validation :normalize_title_author, on: :create

  scope :available, -> { where(availability: true) }

  private

  def normalize_title_author
    self.title = title.downcase.titleize
    self.author = author.downcase.titleize
  end
end
