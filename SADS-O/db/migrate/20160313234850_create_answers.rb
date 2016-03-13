class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :user_name
      t.string :blood_group
      t.string :email
      t.string :phone
      t.string :cellphone
      t.string :message
      t.references :posts, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
