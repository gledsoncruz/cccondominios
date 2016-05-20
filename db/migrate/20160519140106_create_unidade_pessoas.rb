class CreateUnidadePessoas < ActiveRecord::Migration
  def change
    create_table :unidade_pessoas, {:id => false} do |t|

      t.belongs_to :unidade, index: true
      t.belongs_to :pessoa, index: true

      t.timestamps null: false
    end
    add_foreign_key :unidade_pessoas, :unidades
    add_foreign_key :unidade_pessoas, :pessoas
    execute "ALTER TABLE unidade_pessoas ADD PRIMARY KEY (unidade_id, pessoa_id);"
  end
end
