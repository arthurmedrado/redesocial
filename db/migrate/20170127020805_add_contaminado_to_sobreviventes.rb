class AddContaminadoToSobreviventes < ActiveRecord::Migration[5.0]
  def change
    add_column :sobreviventes, :contaminado, :integer, default: 0
  end
end
