FactoryBot.define do
  factory :label_one ,class: Label do
    name { "国内" }
  end
  factory :label_two ,class: Label do
    name { "国際" }
  end

  factory :label_tree ,class: Label do
    name { "経済" }
  end
  factory :label_four ,class: Label do
    name { "エンタメ" }
  end
  factory :label_five ,class: Label do
    name { "スポーツ" }
  end
  factory :label_six ,class: Label do
    name { "IT" }
  end
  factory :label_seven ,class: Label do
    name { "科学" }
  end
  factory :label_eight,class: Label do
    name { "ライフ" }
  end
  factory :label_nine ,class: Label do
    name { "地域" }
  end
end
