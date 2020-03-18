require 'rails_helper'

describe Admin::Authenticator do
  describe '#authenticate' do
    example '正しいパスワードならtrueを返す' do
      a = build(:user)
      expect(Admin::Authenticator.new(a).authenticate('pw')).to be_truthy
    end
    example '誤ったパスワードならfalseを返す' do
      a = build(:user)
      expect(Admin::Authenticator.new(a).authenticate('x')).to be_falsey
    end
    example 'パスワード未設定ならfalseを返す' do
      a = build(:user, password: nil)
      expect(Admin::Authenticator.new(a).authenticate('pw')).to be_falsey
    end
  end
end