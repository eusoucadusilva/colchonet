class RenameLocalizationOnRooms < ActiveRecord::Migration
	def change
		rename_column :rooms, :localization, :location
	end
end
