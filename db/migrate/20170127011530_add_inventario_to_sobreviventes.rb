class AddInventarioToSobreviventes < ActiveRecord::Migration[5.0]
  def change
    add_column :sobreviventes, :agua, :integer, default: 0
    add_column :sobreviventes, :comida, :integer, default: 0
    add_column :sobreviventes, :medicamento, :integer, default: 0
    add_column :sobreviventes, :municao, :integer, default: 0
  end
end
