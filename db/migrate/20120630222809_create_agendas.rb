class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.references :medico
      t.timestamps
    end
  end
end
