class CreateUnidades < ActiveRecord::Migration
  def change
    create_table :unidades do |t|
      t.belongs_to :bloco, index: true
      t.string :numero, limit: 5, null: false
      t.string :piso, limit: 10, null: false

      t.timestamps null: false
    end
    add_foreign_key :unidades, :blocos
  end
end
