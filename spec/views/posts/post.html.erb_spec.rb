require 'rails_helper'

describe 'posts/index' do
  it "displays all posts" do
    assign(:posts, [
      Post.create!(name: 'hardik', title: 'BTPL - RUBY', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      Post.create!(name: 'purohit', title: 'BTPL - RAILS', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
    ])
    stub_template "posts/_post.html.erb" => "<%= post.name %>"
    render
    expect(rendered).to match /hardik/
  end
end
