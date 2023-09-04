# frozen_string_literal: true

class CreateBorrowings < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      t.date :return_date
      t.boolean :returned

      t.timestamps
    end
  end
end
