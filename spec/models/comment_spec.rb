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

require 'spec_helper'

describe Comment do
  subject(:comment) { create(:comment) }
  let(:comment_with_parent) do
    create(:comment, parent_comment_id: (create :comment).id )
  end

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:link_id) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:link) }
    it { should belong_to(:author) }
    it { should have_many(:subs) }
    it { should have_many(:comments) }
  end

  describe "comment parents" do
    it { (comment_with_parent.parent_comment_id).should_not be_nil }
    it { (comment.parent_comment_id).should be_nil }
  end
end
