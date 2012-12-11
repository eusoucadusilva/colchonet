class AddConfirmationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmated_at, :datetime
    add_column :users, :confirmation_token, :string
  end
end
