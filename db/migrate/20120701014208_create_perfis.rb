class CreatePerfis < ActiveRecord::Migration
  def change
    create_table :perfis do |t|
      t.string :authority

      t.timestamps
    end
  end
end
