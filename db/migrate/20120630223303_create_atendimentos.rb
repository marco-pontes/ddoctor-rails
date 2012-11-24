class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.string :status
      t.boolean :pago
      t.float :precoTotal
      t.references :paciente
      t.references :consulta
      t.datetime :data
      t.timestamps
    end
    add_index :atendimentos, :paciente_id
    add_index :atendimentos, :consulta_id
  end
end
