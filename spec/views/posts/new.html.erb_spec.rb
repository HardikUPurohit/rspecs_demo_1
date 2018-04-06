require "rails_helper"

describe "posts/new" do
  it "controller path" do
    expect(controller.request.path_parameters[:controller]).to eq("posts")
    expect(controller.controller_path).to eq("posts")
  end

  it "controller action" do
    expect(controller.request.path_parameters[:action]).to eq("new")
  end
end
