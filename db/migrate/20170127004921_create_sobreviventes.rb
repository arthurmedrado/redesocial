class CreateSobreviventes < ActiveRecord::Migration[5.0]
  def change
    create_table :sobreviventes do |t|
      t.string :name
      t.string :genero
      t.integer :idade

      t.timestamps
    end
  end
end
