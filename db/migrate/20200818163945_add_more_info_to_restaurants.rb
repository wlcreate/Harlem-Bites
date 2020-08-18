class AddMoreInfoToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :telephone, :string
    add_column :restaurants, :open_time, :time
    add_column :restaurants, :close_time, :time
    add_column :restaurants, :cuisine, :string
    add_column :restaurants, :pricey, :string
    add_column :restaurants, :stars, :string
  end
end
