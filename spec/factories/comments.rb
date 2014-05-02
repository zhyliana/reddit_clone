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

# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    parent_comment_id nil
    association :link, { factory: :link }
    association :author, { factory: :user }

    # factory :comment_with_parent do
#       association :comments, { factory: :comment }
#     end
  end
end
