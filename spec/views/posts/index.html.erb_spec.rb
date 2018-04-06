require 'rails_helper'

describe 'posts/index' do
  it "displays all posts" do
    assign(:posts, [
        Post.create!(name: 'abc', title: 'abcdefghi', content: 'abcdefghijklmnopqrstu'),
        Post.create!(name: 'xyz', title: 'stuvwxyz', content: 'mnopqrstuvwxyz')
      ])

    render

    expect(rendered).to match /abc/
    expect(rendered).to match /xyz/
  end
  it "has a request.fullpath that is defined" do
    expect(controller.request.fullpath).to eq posts_path
  end
end
