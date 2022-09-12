class AddAdministracaoToInstituicao < ActiveRecord::Migration[7.0]
  def change
    add_column :instituicaos, :administracao, :string
  end
end
