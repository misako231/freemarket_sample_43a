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
      item = build(:item, comment: "a"×1001)
      item.valid?
      expect(item.errors[:comment]).to include("is too long")
    end

    it "is valid with an item's comment that has less than 1000 characters" do
      item = build(:item, comment: "a"×1000)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without an item's image" do
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end




  end
end
