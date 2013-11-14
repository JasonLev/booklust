require 'spec_helper'

describe BookUser do
  let(:book_user) { BookUser.create(book_id: 3, user_id: 5) }

  describe "shoule have a:" do

    it 'book_id' do
      book_user.respond_to?(:book_id).should == true
    end

    it 'user_id' do
      book_user.respond_to?(:user_id).should == true
    end
  end

  it 'should not be nil' do
    book_user.should_not == nil
  end

  describe "should not be valid when:" do

    it "book_id is not present" do
      book_user.book_id = " "
      book_user.should_not be_valid
    end

    it "user_id is not present" do
      book_user.user_id = " "
      book_user.should_not be_valid
    end


    it 'all attributes are not provided' do
      new_book_user = BookUser.new
      new_book_user.should_not be_valid
    end
  end

  describe "should validate: " do

    it "user_id" do
      should validate_presence_of :user_id
    end

    it "book_id" do
      should validate_presence_of :book_id
    end
  end

  describe "should have a specified: " do

    it "user_id" do
      book_user.user_id.should == 5
    end

    it "book_id" do
      book_user.book_id.should == 3
    end
  end

  describe "should belong to: " do

    it "book" do
      should belong_to(:book)
    end

    it "user" do
      should belong_to(:user)
    end
  end


end
