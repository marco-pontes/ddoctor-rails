class CreateTarefas < ActiveRecord::Migration
  def change
    create_table :tarefas do |t|
      t.string :nome
      t.string :descricao
      t.string :status
      t.references :consulta
      t.references :usuario

      t.timestamps
    end
    add_index :tarefas, :consulta_id
    add_index :tarefas, :usuario_id
  end
end
