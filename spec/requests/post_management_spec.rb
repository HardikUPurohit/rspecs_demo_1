require 'rails_helper'

describe "Post Management", type: :request do
  before :each do
    get "/posts/new"
    expect(response).to render_template(:new)
    Post.delete_all
  end

  context "Insert New record" do
    it "creates post and redirects to the post's page" do
      post "/posts", params: {post: attributes_for(:post)}
      expect(response).to redirect_to assigns(:post)
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Post was successfully created.")
    end
  end

  context "Edit record" do
    before :each do
      @post = create(:post)
    end

    it "update the record and redirects to posts's page" do
      patch "/posts/#{@post.id}", params: { post: {name: 'hardik'} }
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Post was successfully updated.")
    end

  end

  context "Delete the record", type: :request do
    before :each do
      @post = create(:post)
    end
    it "redirect to home page and verifies flash message" do
      expect do
        delete "/posts/#{@post.id}"
      end.to change(Post, :count).by(-1)
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Post was successfully destroyed.")
    end
  end
 end
