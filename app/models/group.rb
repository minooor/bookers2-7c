class Group < ApplicationRecord

  has_one_attached :image
  has_many :group_users
  has_many :users, through: :group_users
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true
  validates :introduction, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def is_owned_by?(user)
    owner.id == user.id
  end

end
