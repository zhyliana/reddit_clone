# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :string(255)
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  url        :string(255)      default(""), not null
#

class Link < ActiveRecord::Base

  validates :title, :url, :user_id, presence: true

  belongs_to :op, class_name: "User", foreign_key: :user_id
  has_many :comments
  has_many :memberships, class_name: "LinkSub", foreign_key: :link_id
  has_many :subs, through: :memberships, source: :sub

end
