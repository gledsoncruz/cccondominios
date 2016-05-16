class CreateBlocos < ActiveRecord::Migration
  def change
    create_table :blocos do |t|
      t.belongs_to :condominio, index: true
      t.string :descricao, limit: 80, null: false
      t.string :sigla, limit: 10, null: false
      t.string :obs, limit: 200

      t.timestamps null: false
    end
    add_foreign_key :blocos, :condominios
  end
end
