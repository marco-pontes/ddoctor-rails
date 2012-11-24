class CreatePlanosSaude < ActiveRecord::Migration
  def change
    create_table :planos_saude do |t|
      t.string :nome
      t.string :tipo
      t.datetime :validade
      t.integer :numero
      t.timestamps
    end
  end
end
