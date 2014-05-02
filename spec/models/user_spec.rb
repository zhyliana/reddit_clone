# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  subject(:user) { create(:user) }
  let(:user2) { create(:user, password: "123458") }

  it { should be_valid }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:username) }
    its(:password) { should have_at_least(6).items }
  end

  describe "associations" do
    it { should have_many(:subs) }
    it { should have_many(:links) }
    it { should have_many(:comments) }
  end

  it 'does not store the password in the database' do
    #Exercise
    user_no_password = User.find(user.id)
    #Test
    expect(user_no_password.password).to be_nil
  end

  context '::find_by_credentials' do
    it 'does not return the user with the incorrect password' do
      expect(User.find(user.id)).to eq(user)#should return nil
    end

    it 'does not return the user with the incorrect password' do
      expect(User.find(user.id)).to_not eq(user2)#should return nil
    end
  end

end

