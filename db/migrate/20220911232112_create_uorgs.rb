class CreateUorgs < ActiveRecord::Migration[7.0]
  def change
    create_table :uorgs do |t|
      t.string :nome
      t.string :sigla
      t.integer :codigo
      t.integer :pai
      t.integer :instituicao
      t.string :tipo
      t.integer :esfera
      t.integer :poder

      t.timestamps
    end
  end
end
