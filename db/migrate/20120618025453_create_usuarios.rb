class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.boolean :ativo
      t.boolean :contaExpirada
      t.boolean :contaBloqueada
      t.boolean :senhaExpirada
      t.string :nome
      t.integer :idade
      t.string :documento
      t.string :telefone
      t.string :sexo
      t.string :dataNascimento
      t.string :type
      t.string :historico
      t.integer :crm
      t.string :biografia
      t.references :especialidade
      t.references :planoSaude
      t.float :precoConsulta
      t.timestamps
    end
    add_index :usuarios, :especialidade_id
    add_index :usuarios, :planoSaude_id
  end
end
