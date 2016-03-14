class Answer < ActiveRecord::Base
  belongs_to :posts
  validates :user_name, :post_id, :blood_group, :email, presence: true
end
