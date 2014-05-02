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

# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :link do
    title {Faker::Commerce.product_name}
    url {Faker::Internet.url}
    body {Faker::Company.bs}
    association :op, { factory: :user }
  end
end
