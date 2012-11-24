class AddTurnoToAtendentes < ActiveRecord::Migration
  def change
    add_column :atendentes, :turno, :string
  end
end
