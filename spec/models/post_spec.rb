require 'rails_helper'

describe Post, type: :model do
  before :each do
    Post.delete_all
  end
  
  describe 'create post' do
    context 'valid attributes' do
      it "return true when post count increases" do
        post_count = Post.count
        post = Post.create(name: 'hardik', title: 'abcdefghi', content: 'abcdefghi')
        expect(Post.count).to eq( post_count + 1)
      end
      it 'return treu when record inserted' do
        expect(post('abc', 'abcdefghi', 'abcdefghi')).to be_valid
      end
    end

    context "invalid attributes" do
    it "when name is not inserted" do
      post = Post.create(title: 'hii', content: 'hello')
      expect(Post.count).to eq(0)
    end

    it "when title is not inserted" do
      post = Post.create(name: 'hii', content: 'hello')
      expect(Post.count).to eq(0)
    end

    it "check title length that should be >= 5" do
      post = Post.create(name: "hardik", title: 'abc', content: 'abcdefghi')
      expect(Post.count).to eq(0)
    end

    it 'is not valid name' do
      expect(post(nil)).to_not be_valid
    end

    it 'title length that should be >= 5' do
      expect(post('abc', 'abc', 'abcdefghi')).to_not be_valid
    end
  end
  end
end

private

def post(name=nil, title=nil, content=nil)
  Post.new.tap do |post|
    post.name = name
    post.title = title
    post.content = content
  end
end
