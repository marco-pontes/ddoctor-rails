class CreatePerfisUsuarios < ActiveRecord::Migration
  def change
    create_table :perfis_usuarios, :id => false do |t|
      t.references :usuario,  :null => false
      t.references :perfil,  :null => false

    end
    add_index :perfis_usuarios, :usuario_id
    add_index :perfis_usuarios, :perfil_id
  end
end
