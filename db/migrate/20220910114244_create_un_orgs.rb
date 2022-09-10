class CreateUnOrgs < ActiveRecord::Migration[7.0]
  def change
    create_table :un_orgs do |t|
      t.string :nome
      t.string :sigla
      t.string :código

      t.timestamps
    end
  end
end
