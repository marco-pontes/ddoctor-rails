class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.string :cep
      t.integer :numero
      t.string :complemento
      t.string :cidade
      t.string :estado
      t.references :usuario

      t.timestamps
    end
    add_index :enderecos, :usuario_id
  end
end
