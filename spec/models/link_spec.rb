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

require 'spec_helper'

describe Link do
  subject(:link) { create(:link) }

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should have_many(:subs) }
    it { should belong_to(:op) }
    it { should have_many(:comments) }
  end
end
