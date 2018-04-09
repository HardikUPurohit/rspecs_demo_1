require 'rails_helper'

describe 'posts/index' do
  it "displays all posts" do
    assign(:posts, [
        Post.create!(name: 'hardik', title: 'BTPL - RUBY', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
        Post.create!(name: 'purohit', title: 'BTPL - RAILS', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
      ])

    render

    expect(rendered).to match /hardik/
    expect(rendered).to match /purohit/
  end
  it "has a request.fullpath that is defined" do
    expect(controller.request.fullpath).to eq posts_path
  end
end
