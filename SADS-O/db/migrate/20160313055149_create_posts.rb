class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_name
      t.string :user_name
      t.string :blood_type
      t.text :message
      t.integer :user_id
      t.boolean :solved, default: false
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
