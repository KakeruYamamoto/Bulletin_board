require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    @post1 = FactoryBot.create(:post, user_id: @user1.id)
  end
  it "contentが空欄ならバリデーションが通らない" do
    comment = Comment.new(name: 'test太郎', content: '' ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).not_to be_valid
  end
  it "nameが空欄ならバリデーションが通らない" do
    comment = Comment.new(name: '',content: 'testtesttesttest' ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).not_to be_valid
  end
  it "contentが130文字以上ならバリデーションが通らない" do
    comment = Comment.new(name: 'test太郎',content: 'a'*131 ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).not_to be_valid
  end
  it "nameが130文字以上ならバリデーションが通らない" do
    comment = Comment.new(name: 'a'*131,content: 'testtesttesttest' ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).not_to be_valid
  end
  it "nameとcontentが記載していればバリデーションが通る" do
    comment = Comment.new(name: 'test太郎',content: 'aaaaa' ,post_id: @post1.id,user_id: @user2.id )
    expect(comment).to be_valid
  end
end
