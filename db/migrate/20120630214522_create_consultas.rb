class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.references :agenda
      t.datetime :data
      t.string :status
      t.references :entrevistaMedica, :null => true
      t.references :medico
      t.references :paciente
      t.timestamps
    end
    add_index :consultas, :entrevistaMedica_id
    add_index :consultas, :agenda_id
  end
end
