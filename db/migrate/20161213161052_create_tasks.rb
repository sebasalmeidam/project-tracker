class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :project
      t.string :description
      t.date :task_date
      t.text :result
      t.string :pending
      t.string :client_p
      t.string :firm_p
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
