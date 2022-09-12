class RemoveColumnInstituicaoFromUorg < ActiveRecord::Migration[7.0]
  def change
    remove_column :uorgs, :instituicao
  end
end
