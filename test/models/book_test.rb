require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  Rspec.describe Book, type: :model do
    context "データが正しく保存される" do
      before do
        @book = Book.new
        @book.title = "こんにちは"
        @book.body = "今日も晴れです"
        @book.save
      end
      it "全て入力してあるので保存される" do
        expect(@book).to be_valid
      end
    end
  end
end
