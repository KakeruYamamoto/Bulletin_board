FactoryBot.define do

  factory :post , class: Post do
    title { 'test_post_01' }
  end

  factory :second_post, class: Post do
    title { 'test_post_02' }
  end

  factory :third_post, class: Post do
    title { 'test_post_03' }
  end


end
