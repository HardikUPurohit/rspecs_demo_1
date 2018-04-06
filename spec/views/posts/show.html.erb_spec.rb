require 'rails_helper'

describe 'posts/show' do
  before :each do
    @post = create(:post)
  end

  it 'check the name' do
    render 'posts/post', post: @post

    expect(rendered).to match /abc/
  end

  it 'displays first record' do
    controller.extra_params = {id: @post.id}
    
    expect(controller.request.fullpath).to eq post_path(@post)
  end

end
