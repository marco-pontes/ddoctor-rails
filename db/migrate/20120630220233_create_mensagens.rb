class CreateMensagens < ActiveRecord::Migration
  def change
    create_table :mensagens do |t|
      t.integer :destinatario_id
      t.integer :remetente_id
      t.string :assunto
      t.string :tipo
      t.string :corpo
      t.timestamp :dataEnvio

      t.timestamps
    end
      add_index :mensagens, :destinatario_id
      add_index :mensagens, :remetente_id
  end
end
