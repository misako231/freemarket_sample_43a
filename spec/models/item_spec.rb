require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid with an item's name that has more than 41 characters" do
      item = build(:item, name: "11111111112222222222111111111122222222221")
      item.valid?
      expect(item.errors[:name][0]).to include("is too long")
    end

    it "is valid with an item's name that has less than 40 characters" do
      item = build(:item, name: "1111111111222222222211111111112222222222")
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without an item's name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an item's comment" do
      item = build(:item, comment: nil)
      item.valid?
      expect(item.errors[:comment]).to include("can't be blank")
    end

    it "is invalid without an item's price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid with an item's comment that has more than 1001 characters" do
      item = build(:item, comment: "a"*1001)
      item.valid?
      expect(item.errors[:comment]).to include("is too long")
    end

    it "is valid with an item's comment that has less than 1000 characters" do
      item = build(:item, comment: "a"*1000)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without an item's image" do
      item = build(:item)
      item.item-photoes = nil
      item.valid?
      expect(item.item-photoes.errors[:image]).to include("can't be blank")
    end

    it "is invalid without an item's category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without an item's condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without an item's shipping_fee" do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include("can't be blank")
    end

    it "is invalid without an item's prefecture" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include("can't be blank")
    end

    it "is invalid without an item's days-to-ship" do
      item = build(:item, days-to-ship: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include("can't be blank")
    end


  end
end
