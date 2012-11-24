class CreateEntrevistaMedicas < ActiveRecord::Migration
  def change
    create_table :entrevista_medicas do |t|
      t.string :problema
      t.string :medicacao
      t.string :observacoes
      t.string :laudoMedico
      t.string :altura
      t.string :peso
      t.string :pressao

      t.timestamps
    end
  end
end
