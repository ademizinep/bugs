class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, limit: 64

      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
