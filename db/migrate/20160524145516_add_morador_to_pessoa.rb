class AddMoradorToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :morador, :boolean
  end
end
