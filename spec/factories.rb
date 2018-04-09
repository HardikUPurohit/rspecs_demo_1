FactoryBot.define do
  factory :post do
    name "hardik"
    title "BTPL - RUBY"
    content "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  end

  factory :invalid_post, class: 'Post' do
    title 'BTC'
    content 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  end
end
