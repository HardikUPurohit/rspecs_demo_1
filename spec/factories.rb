FactoryBot.define do
  factory :post do
    name "abc"
    title "abcdefghi"
    content "hiiii"
  end

  factory :invalid_post, class: 'Post' do
    title 'abc'
    content 'kaukhsdkasdhkask'
  end
end
