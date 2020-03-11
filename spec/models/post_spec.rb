
require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user1 = FactoryBot.create(:first_user)
  end
  it "titleが空ならバリデーションが通らない" do
    post = Post.new(title: '', user_id: @user1.id)
    expect(post).to be_invalid
  end
  it "全項目に内容が記載されていればバリデーションが通る" do
    post = Post.new(title: '成功テスト', user_id: @user1.id)
    expect(post).to be_valid
  end
end
