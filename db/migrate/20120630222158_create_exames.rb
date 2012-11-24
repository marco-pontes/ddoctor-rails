class CreateExames < ActiveRecord::Migration
  def change
    create_table :exames do |t|
      t.string :nome
      t.string :descricao
      t.float :preco
      t.references :atendimento

      t.timestamps
    end
    add_index :exames, :atendimento_id
  end
end
