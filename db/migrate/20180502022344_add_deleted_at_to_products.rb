# frozen_string_literal: true

class AddDeletedAtToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :deleted_at, :datetime
  end
end
