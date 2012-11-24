class CreateMedicacoes < ActiveRecord::Migration
  def change
    create_table :medicacoes do |t|
      t.string :nome
      t.string :tarja
      t.string :bula
      t.integer :quantidade
      t.string :unidade
      t.string :fabricante
      t.datetime :data_compra
      t.timestamps
    end
  end
end
