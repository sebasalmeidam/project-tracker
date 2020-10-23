class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :client, index: true, foreign_key: true
      t.boolean :admin_type, default: false
      t.boolean :client_type, default: false

      t.timestamps null: false
    end
  end
end
