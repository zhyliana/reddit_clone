# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  body              :text             not null
#  parent_comment_id :integer
#  parent_link_id    :integer
#  link_id           :integer          not null
#  user_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
end
