# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ラベル
  Label.create!(name: "国内")
  Label.create!(name: "国際")
  Label.create!(name: "経済")
  Label.create!(name: "エンタメ")
  Label.create!(name: "スポーツ")
  Label.create!(name: "IT")
  Label.create!(name: "科学")
  Label.create!(name: "ライフ")
  Label.create!(name: "地域")

# ユーザ生成
  30.times do |n|
    name = Faker::Name.name
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 )

  end


#スレッドを持たせるユーザ生成
  email1 = Faker::Internet.email
  email2 = Faker::Internet.email
  password = "password"

#ユーザのスレッド１
  num = 0

  test_user1 = User.create(name: "test_user1",
    email: email1,
    password: password,
    password_confirmation: password,
  )
  10.times do |n|
    n_rand = rand(1..9)
    num += 1
    title = Faker::Game.title
    I18n.locale = 'ja'
    posts1 = test_user1.posts.build(title: title,label_ids: "#{n_rand}")
    posts1.save
  end

#ユーザのスレッド２
  test_user2 = User.create(name: "test_user2",
    email: email2,
    password: password,
    password_confirmation: password,
  )
  10.times do |n|
    num += 1
    title = Faker::Game.title
    I18n.locale = 'ja'
    posts2 = test_user2.posts.build(title: title)
    posts2.save
  end

#テストユーザ３

  test_user3 = User.create(name: "田中太郎",
              email: 'tanaka@mail.com',
              password: 'tanaka@mail.com',
              password_confirmation: 'tanaka@mail.com',
              )

#ユーザのスレッド3
  10.times do |n|
    num += 1
    title = Faker::Game.title
    posts3 = test_user3.posts.build(title: title)
    posts3.save
  end

#ラベル
  Label.create!(name: "国内")
  Label.create!(name: "国際")
  Label.create!(name: "経済")
  Label.create!(name: "エンタメ")
  Label.create!(name: "スポーツ")
  Label.create!(name: "IT")
  Label.create!(name: "科学")
  Label.create!(name: "ライフ")
  Label.create!(name: "地域")
