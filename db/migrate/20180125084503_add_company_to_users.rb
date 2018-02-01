class AddCompanyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :company, null: true, foreign_key: true
  end
end
