require 'rails_helper'


RSpec.describe User, type: :model do

  subject(:user) { User.create!(email: "test@mail.com", password: "password") }
  # do
  #   FactoryGirl.build(:user,
  #     email: "test@mail.com",
  #     password: "password")
  # end
  #

  describe "User validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest)}
    it { should validate_length_of(:password).is_at_least(6)}
  end

  describe "#is_password?" do

    it "returns true for correct password" do
      expect(user.is_password?("password")).to be_truthy
    end

    it "returns false for incorrect password" do
      expect(user.is_password?("password1")).to be_falsey
    end
  end

  describe "#reset_session_token!" do
    it "resets user session_token" do
      subject.ensure_session_token
      orig_session_token = subject.session_token.dup
      subject.reset_session_token!
      expect(subject.session_token).to_not eq(orig_session_token)
    end
  end

  describe "::find_by_credentials" do

    context "with valid user" do
      it "finds the correct user" do
        user1 = User.find_by_credentials("test@mail.com", "password")
        expect(user1).to eq(user)
      end
    end
    context "with invalid input" do
      it "returns nil" do
        user1 = User.find_by_credentials("test@mail.com", "password")
        expect(user1).to be_nil
      end
    end
  end


end
