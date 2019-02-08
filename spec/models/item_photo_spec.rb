require 'rails_helper'

describe ItemPhotoesController do

  describe '#create' do
    context "with valid attributes" do
      it "has a valid factory" do
        image = build(:item_photo)
        expect(image).to be_valid
      end
    end
  end

end
