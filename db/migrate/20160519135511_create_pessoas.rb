class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :cpf, limit: 15
      t.string :cnpj, limit: 15
      t.string :nome, limit: 80, null: false
      t.date :dta_nasc, null: false
      t.string :sexo, null: false
      t.string :email, limit: 40
      t.string :cel, limit: 15
      t.string :tel, limit: 15
      t.boolean :proprietario
      t.string :tipo, limit: 20, null: false

      t.timestamps null: false
    end
  end
end
