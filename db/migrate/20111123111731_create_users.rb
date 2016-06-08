class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.timestamps
      t.datetime :deleted_at
      
      # Foreign Keys
      t.integer :role_id
      t.integer :client_id
    end
  end
end
