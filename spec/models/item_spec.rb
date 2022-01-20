require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it 'image、item_name、content、category、delivery、scheduled、area、condition、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it 'categoryが空白では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'conditionが空白では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'deliveryが空白では登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it 'areaが空白では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'scheduledが空白では登録できない' do
        @item.scheduled_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled can't be blank"
      end
      it 'priceが空白では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが¥300より低いと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが¥9,999,999より高いと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceは半角数値でないと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
