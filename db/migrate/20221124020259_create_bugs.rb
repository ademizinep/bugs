class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.text :description, null: false

      t.string :resume, null: false, limit: 256
      t.string :link, null: false
      t.string :estimative, null: false, limit: 16

      t.integer :status, default: 0
      t.integer :quality_assurance_status, default: 0
      t.integer :responsible_sector, default: 0
      t.integer :priority, default: 0

      t.integer :responsible_related_id
      t.integer :reponsible_solution_id
      t.integer :quality_assurance_responsible_id

      t.decimal :percentage_solution, null: false, default: 0.0

      t.datetime :need_for_resolution_at
      t.datetime :resolved_at

      t.references :project, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
