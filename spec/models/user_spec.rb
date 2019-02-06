require 'rails_helper'
describe User do
  describe '#create' do
    it 'is valid with a nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_y,birth_m,birth_d' do
      user = build(:user)
      expect(user).to be_valid
    end
    it 'is invalid without a nickname' do
      user = build(:user,nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "is invalid with a nickname that has more than 21 characters " do
      user = build(:user, nickname: "a"*21 )
      user.valid?
      expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
    end
    it "is valid with a nickname that has 20 characters " do
      user = build(:user, nickname: "a"*20 )
      expect(user).to be_valid
    end
    it 'is invalid without a email' do
      user = build(:user,email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it 'is invalid without a password' do
      user = build(:user,password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user,password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end
    it "is invalid with a password that has more than 129 characters " do
      user = build(:user, password: "0"*129, password_confirmation:  "0"*129)
      user.valid?
      expect(user.errors[:password][0]).to include("は128文字以内で入力してください")
    end
    it "is valid with a password that has 6 characters " do
      user = build(:user, password: "0"*6, password_confirmation: "0"*6 )
      expect(user).to be_valid
    end
    it "is valid with a password that has 128 characters " do
      user = build(:user, password: "0"*128, password_confirmation: "0"*128 )
      expect(user).to be_valid
    end
    it 'is invalid without last_name' do
      user = build(:user,last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it 'is invalid without first_name' do
      user = build(:user,first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it 'is invalid without last_name_kana' do
      user = build(:user,last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
    it 'is invalid without first_name_kana' do
      user = build(:user,first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it 'it invalid with a last name that has more than 35 characters' do
      user = build(:user, last_name: "a"*36 )
      user.valid?
      expect(user.errors[:last_name][0]).to include("は35文字以内で入力してください")
    end
    it 'it invalid with a first name that has more than 35 characters' do
      user = build(:user, first_name: "a"*36 )
      user.valid?
      expect(user.errors[:first_name][0]).to include("は35文字以内で入力してください")
    end
    it 'it invalid with a last name kana that has more than 35 characters' do
      user = build(:user, last_name_kana: "ア"*36 )
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("は35文字以内で入力してください")
    end
    it 'it invalid with a first name kana that has more than 35 characters' do
      user = build(:user, first_name_kana: "ア"*36 )
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("は35文字以内で入力してください")
    end
    it "is valid with a last name that has 35 characters " do
      user = build(:user, last_name: "a"*35 )
      expect(user).to be_valid
    end
    it "is valid with a first name that has 35 characters " do
      user = build(:user, first_name: "a"*35 )
      expect(user).to be_valid
    end
    it "is valid with a last name kana that has 35 characters " do
      user = build(:user, last_name_kana: "ア"*35 )
      expect(user).to be_valid
    end
    it "is valid with a first name kana that has 35 characters " do
      user = build(:user, first_name_kana: "ア"*35 )
      expect(user).to be_valid
    end
    it 'is invalid without birth_y' do
      user = build(:user,birth_y: nil)
      user.valid?
      expect(user.errors[:birth_y]).to include("を入力してください")
    end
    it 'is invalid without birth_m' do
      user = build(:user,birth_m: nil)
      user.valid?
      expect(user.errors[:birth_m]).to include("を入力してください")
    end
    it 'is invalid without birth_d' do
      user = build(:user,birth_d: nil)
      user.valid?
      expect(user.errors[:birth_d]).to include("を入力してください")
    end
  end
end
