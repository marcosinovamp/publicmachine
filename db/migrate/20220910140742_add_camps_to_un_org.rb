class AddCampsToUnOrg < ActiveRecord::Migration[7.0]
  def change
    add_column :un_orgs, :tipo, :string
    add_column :un_orgs, :unidade_pai, :string
    add_column :un_orgs, :orgao_entidade, :string
  end
end
