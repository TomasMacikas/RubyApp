class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :age
      t.string :token
      t.string :role

      t.timestamps
    end
  end
end
