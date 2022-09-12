class AddNaturezaInstituicao < ActiveRecord::Migration[7.0]
  def change
    add_column :instituicaos, :natureza, :string
  end
end
