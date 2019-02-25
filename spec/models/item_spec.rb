require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid with an item's name that has more than 41 characters" do
      item = build(:item, name: "1"*41)
      item.valid?
      expect(item.errors[:name][0]).to include("は40文字以内で入力してください")
    end

    it "is valid with an item's name that has less than 40 characters" do
      user = create(:user)
      # category = create(:category)
      item = create(:item, name: "1"*40)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without an item's name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without an item's comment" do
      item = build(:item, comment: nil)
      item.valid?
      expect(item.errors[:comment]).to include("を入力してください")
    end

    it "is invalid without an item's price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "is invalid with an item's comment that has more than 1001 characters" do
      item = build(:item, comment: "a"*1001)
      item.valid?
      expect(item.errors[:comment]).to include("は1000文字以内で入力してください")
    end

    it "is valid with an item's comment that has less than 1000 characters" do
      item = create(:item, comment: "a"*1000)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without an item's image" do
      item = build(:item)
      item.item_photos = []
      item.valid?
      expect(item.errors[:item_photos]).to include("を入力してください")
    end

    it "is invalid without an item's category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without an item's condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "is invalid without an item's shipping_fee" do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include("を入力してください")
    end

    it "is invalid without an item's prefecture" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without an item's days_to_ship" do
      item = build(:item, days_to_ship: nil)
      item.valid?
      expect(item.errors[:days_to_ship]).to include("を入力してください")
    end

  end
end
