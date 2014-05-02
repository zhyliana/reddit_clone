# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  link_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
  factory :link_sub do
    association :link, { factory: :link }
    association :sub, { factory: :sub }
  end
end
