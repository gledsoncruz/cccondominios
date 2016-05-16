class CreateCondominios < ActiveRecord::Migration
  def change
    create_table :condominios do |t|
      t.string :nome
      t.string :cnpj
      t.string :endereco
      t.string :cidade
      t.string :uf
      t.string :cep

      t.timestamps null: false
    end
  end
end
