class RemoveEsferaPoderBothTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :instituicaos, :esfera
    remove_column :instituicaos, :poder
    remove_column :uorgs, :esfera
    remove_column :uorgs, :poder
  end
end
