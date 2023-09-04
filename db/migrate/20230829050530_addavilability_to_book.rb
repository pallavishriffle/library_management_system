# frozen_string_literal: true

class AddavilabilityToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :availability, :boolean
  end
end
