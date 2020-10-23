class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :incharge, :string
    add_column :tasks, :pending_date, :date
    add_column :tasks, :done, :boolean, null: false, default: false
    add_column :tasks, :hours, :integer
  end
end
