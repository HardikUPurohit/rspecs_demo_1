require 'rails_helper'

describe Post, type: :model do
  before :each do
    Post.delete_all
  end
  
  describe 'create post' do
    context 'valid attributes' do
      it "return true when post count increases" do
        post_count = Post.count
        post = Post.create(name: 'hardik', title: 'BTPL - RUBY', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
        expect(Post.count).to eq( post_count + 1)
      end
      it 'return truewhen record inserted' do
        expect(post('abc', 'BTPL - RUBY', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')).to be_valid
      end
    end

    context "invalid attributes" do
      it "when name is not inserted" do
        post = Post.create(title: 'BTPL - RUBY', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
        expect(Post.count).to eq(0)
      end

      it "when title is not inserted" do
        post = Post.create(name: 'hardik', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
        expect(Post.count).to eq(0)
      end

      it "check title length that should be >= 5" do
        post = Post.create(name: "hardik", title: 'BTC', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
        expect(Post.count).to eq(0)
      end

      it 'is not valid name' do
        expect(post(nil)).to_not be_valid
      end

      it 'title length that should be >= 5' do
        expect(post('hardik', 'BTC', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')).to_not be_valid
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
