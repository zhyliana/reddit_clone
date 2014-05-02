# == Schema Information
#
# Table name: subs
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Sub < ActiveRecord::Base

  belongs_to :admin, class_name: "User", foreign_key: :user_id
  has_many :comments, through: :links, source: :comments
  has_many :memberships, class_name: "LinkSub", foreign_key: :sub_id
  has_many :links, through: :memberships, source: :link

  validates :name, :user_id, presence: true

end
