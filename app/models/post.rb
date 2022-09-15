class Post < ApplicationRecord

  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :favorite, dependent: :destroy
  validates :title, presence: true
  validates :body,presence: true
  validates :body,length:{maximum:200}

  def favorited_by?(user)
   favorite.exists?(user_id: user.id)
  end
end
