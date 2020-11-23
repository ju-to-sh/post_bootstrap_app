require "rails_helper"

RSpec.describe Post, type: :model do
  describe "postモデルのバリデーション" do
    it "タイトルに空文字を入力し投稿すると、エラーが出ること" do
      post = Post.new(title: "", content: "test")
      post.valid?
      expect(post.errors.added?(:title, :blank)).to be_truthy
    end

    it "タイトルに50文字以上を入力し投稿すると、エラーが出ること" do
      post = Post.new(title: "a" * 51, content: "test")
      post.valid?
      expect(post.errors.added?(:title, :too_long, count: 50)).to be_truthy
    end

    it "内容に空文字を入力し投稿すると、エラーが出ること" do
      post = Post.new(title: "test", content: "")
      post.valid?
      expect(post.errors.added?(:content, :blank)).to be_truthy
    end

    it "内容に500文字以上を入力し投稿すると、エラーが出ること" do
      post = Post.new(title: "test", content: "a" * 501)
      post.valid?
      expect(post.errors.added?(:content, :too_long, count: 500)).to be_truthy
    end
  end
end
