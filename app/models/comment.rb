# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  body              :text             not null
#  parent_comment_id :integer
#  link_id           :integer          not null
#  user_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base

  validates :body, :link_id, :user_id, presence: true

  belongs_to :link
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :comments, class_name: "Comment", foreign_key: :parent_comment_id
  has_many :subs, through: :link, source: :subs

end
