# frozen_string_literal: true

class CreateBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.string :contact_info

      t.timestamps
    end
  end
end
