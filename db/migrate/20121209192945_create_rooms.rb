class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :localization
      t.text :description

      t.timestamps
    end
  end
end
