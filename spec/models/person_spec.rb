require 'rails_helper'

RSpec.describe Person, type: :model do

  let!(:test_person) { create(:person) }

  it "is valid" do
    expect(test_person).to be_valid
  end

  it "is invalid with no email" do
    user = build(:person, email: nil)
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with wrong email format" do
    user = build(:person, email: "test")
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("is invalid")
  end

  it "is invalid with non unique email" do
    user = build(:person, email: test_person.email)
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is invalid with no name" do
    user = build(:person, name: nil)
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
