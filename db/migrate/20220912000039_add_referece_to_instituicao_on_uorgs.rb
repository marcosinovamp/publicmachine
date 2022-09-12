class AddRefereceToInstituicaoOnUorgs < ActiveRecord::Migration[7.0]
  def change
    add_reference :uorgs, :instituicao
  end
end
