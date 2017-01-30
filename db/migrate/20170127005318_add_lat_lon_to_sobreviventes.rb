class AddLatLonToSobreviventes < ActiveRecord::Migration[5.0]
  def change
    add_column :sobreviventes, :lat, :decimal
    add_column :sobreviventes, :lon, :decimal
  end
end
