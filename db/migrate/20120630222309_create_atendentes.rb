class CreateAtendentes < ActiveRecord::Migration
  def change
    create_table :atendentes do |t|

      t.timestamps
    end
  end
end
