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

require 'spec_helper'

describe Sub do
  subject(:sub) { create(:sub) }

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:admin) }
    it { should have_many(:links) }
    it { should have_many(:comments) }
  end
end
