require 'rails_helper'

describe 'posts/index' do
  it "displays all posts" do
    assign(:posts, [
      Post.create!(name: 'abc', title: 'abcdefghi', content: 'abcdefghijklmnopqrstu'),
      Post.create!(name: 'xyz', title: 'stuvwxyz', content: 'mnopqrstuvwxyz')
    ])
    stub_template "posts/_post.html.erb" => "<%= post.name %>"
    render
    expect(rendered).to match /abc/
  end
end
