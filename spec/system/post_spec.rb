require 'rails_helper'

RSpec.describe "すれっど管理機能", type: :system do
  before do
    @user1 = FactoryBot.create(:first_user)
    @post1 = FactoryBot.create(:post, user_id: @user1.id)
    @post2 = FactoryBot.create(:second_post, user_id: @user1.id)
    @post3 = FactoryBot.create(:third_post, user_id: @user1.id)
    @label1 = FactoryBot.create(:label_one)
    @label2 = FactoryBot.create(:label_two)
    @label3 = FactoryBot.create(:label_tree)
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_on "サインイン"
  end

  scenario 'すれっど一覧のテスト' do
    # binding.pry
    visit root_path
    expect(page).to have_content 'test_post_01'
  end

  scenario 'すれっど作成のテスト' do
    visit new_post_path
    fill_in "post[title]", with: 'postsample'
    click_on '登録する'
    expect(page).to have_content 'postsample'
  end

  scenario 'すれっど詳細のテスト' do
    visit posts_path(@post1.id)
    expect(page).to have_content 'test_post_01'
  end

  scenario "すれっど更新テスト" do
    visit post_path(@post2.id)
    click_on '編集'
    fill_in "post[title]", with: 'postsample22'
    click_on '登録する'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'postsample22'
  end

  scenario "すれっど検索のテスト" do
    visit posts_path
    fill_in "q[title_cont_any]", with: 'test_post_01'
    click_on '検索'
    expect(page).to have_content "test_post_01"
  end
end
