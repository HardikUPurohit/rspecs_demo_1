require 'rails_helper'

describe "Post Management", type: :feature do
  before :each do
    Post.delete_all
  end

  describe "create post" do
    scenario "valid attibutes" do
      visit 'posts/new'

      fill_in "Name", with: 'asdasd'
      fill_in "Title", with: 'asdasdasdsadasdsad'
      fill_in "Content", with: 'asdasdasdasdsadsadasdassad'

      click_button "Create Post"
      expect(page).to have_text("Post was successfully created.")
    end

    scenario "invalid attributes" do
      visit 'posts/new'
      fill_in "Title", with: 'asdasdasdsadasdsad'
      fill_in "Content", with: 'asdasdasdasdsadsadasdassad'

      click_button "Create Post"
      expect(page).to have_text("Name can't be blank")

    end
  end

  describe "edit post" do
    before :each do
      @post = create(:post)
    end

    scenario 'valid attributes' do
      visit "/posts/#{@post.id}/edit"

      fill_in "Name", with: 'asdasd'
      fill_in "Title", with: 'asdasdasdsadasdsad'
      fill_in "Content", with: 'asdasdasdasdsadsadasdassad'

      click_button "Update Post"
      expect(page).to have_text("Post was successfully updated.")
    end

    scenario "invalid attributes" do
      visit "/posts/#{@post.id}/edit"

      fill_in "Name", with: ""
      fill_in "Title", with: 'asdasdasdsadasdsad'
      fill_in "Content", with: 'asdasdasdasdsadsadasdassad'

      click_button "Update Post"
      expect(page).to have_text("Name can't be blank")
    end
  end

  describe "delete post" do
    before :each do
      @post = create(:post)
    end

    scenario 'Delete the post' do
      visit '/posts'

      expect { click_link 'Destroy' }.to change(Post, :count).by(-1)
    end

    scenario 'flash after deleting the post' do
      visit '/posts'
      click_link 'Destroy'
      expect(page).to have_text("Post was successfully destroyed.")
    end
  end

  describe "show" do
    before :each do
      @post = create(:post)
    end

    scenario 'show the event' do
      visit "/posts/#{@post.id}"

      expect(page).to have_text("Name")
    end
  end
end
