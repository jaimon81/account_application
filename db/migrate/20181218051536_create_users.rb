class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :password
      t.string :email
      t.text :address
      t.string :age
      t.integer :prof_pic_id
      t.string :prof_pic_file_name
      t.string :prof_pic_content_type
      t.integer :prof_pic_file_size
      t.timestamps
    end
  end
end
