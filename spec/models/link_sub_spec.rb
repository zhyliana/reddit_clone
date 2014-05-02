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

require 'spec_helper'

describe LinkSub do
  subject(:link_sub) { create(:link_sub) }

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:link_id) }
    it { should validate_presence_of(:sub_id) }
  end

  describe "associations" do
    it { should belong_to(:sub) }
    it { should belong_to(:link) }
  end
end
