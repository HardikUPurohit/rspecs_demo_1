require "rails_helper"

describe PostsController, type: :controller do
  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders all posts" do
      create(:post)
      get :index
      assert_equal Post.all, assigns(:posts)
    end
  end

  describe "#create" do
    context "valid attributes" do
      it "post count increase by one" do
        expect do
          post :create, params: { post: attributes_for(:post)  }
        end.to change { Post.count }.by(1)
      end

      it "redirects to the new post" do
        post :create, params: { post: attributes_for(:post)  }
        expect(response).to redirect_to Post.last
      end
    end

    context "invalid attributes" do
      it 'does not save the data' do
        expect do
          post :create, params: { post: attributes_for(:invalid_post)  }
        end.to_not change { Post.count }
      end
      it 're-render new' do
        post :create, params: { post: attributes_for(:invalid_post)  }
        expect(response).to render_template :new
      end
    end
  end

  describe '#show' do
    it "render show template" do
      post = create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end

  describe '#new' do
    it "render new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    before :each do
      @post = create(:post)
    end

    context "valid attibutes" do
      it "update the post" do
        put :update, params: {id: @post, post: {name: 'hardik', title: 'asdasdsadsad', content: 'fghhgffghhgf', }}
        @post.reload
        expect(response).to redirect_to @post
      end

      it "changes in @post attibutes" do
        put :update, params: {id: @post, post: {name: 'hardik', title: 'asdasdsadsad', content: 'fghhgffghhgf', }}
        @post.reload
        expect(@post.name).to eq("hardik")
      end
    end

    context "invalid attibutes" do
      it "render the edit template" do
        put :update, params: {id: @post, post: {name: nil, title: 'asdasdsadsad', content: 'fghhgffghhgf', }}
        expect(response).to render_template :edit
      end

      it "changes in @post attibutes" do
        put :update, params: {id: @post, post: {name: nil, title: 'asdasdsadsad', content: 'fghhgffghhgf', }}
        @post.reload
        expect(@post.name).to_not eq(nil)
      end
    end
  end

  describe '#destroy' do
    before :each do
      @post = create(:post)
    end

    it "deletes the post" do
      expect do
        delete :destroy, params: { id: @post }
      end.to change(Post, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, params: { id: @post }
      expect(response).to redirect_to posts_url
    end
  end
end
