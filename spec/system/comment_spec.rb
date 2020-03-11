require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    @post1 = FactoryBot.create(:post, user_id: @user1.id)
    
  end
  before(:each) do
    visit new_user_session_path
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_on "サインイン"
  end

  it '投稿にコメントをするテスト' do
    visit post_path(@post1.id)
    fill_in "comment[name]", with: '名無し太郎'
    fill_in "comment[content]", with: 'hello'
    click_on 'commit'
    expect(page).to have_content('hello')
  end

end
