require 'rails_helper'

RSpec.describe DealAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @deal_address = FactoryBot.build(:deal_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it '必要な情報が全て存在すれば購入できる' do
        expect(@deal_address).to be_valid
      end

      it 'buildingはなくても購入できる' do
        @deal_address.building = ''
        expect(@deal_address).to be_valid
      end
    end
    context '購入できない場合' do

      it 'userが紐付いていないと保存できない' do
        @deal_address.user_id = nil
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("User can't be blank")
        sleep(1)
      end

      it 'itemが紐付いていないと保存できない' do
        @deal_address.item_id = nil
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Item can't be blank")
        sleep(1)
      end

      it 'housenumberが空では登録できない' do
        @deal_address.housenumber = ''
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Housenumber can't be blank")
        sleep(1)
      end

      it 'housenumberは-を含まないと登録できない' do
        @deal_address.housenumber = '1234567'
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include('Housenumber is invalid. Include hyphen(-)')
        sleep(1)
      end

      it 'housenumberは3桁-4桁でないと登録できない' do
        @deal_address.housenumber = '1234-567'
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include('Housenumber is invalid. Include hyphen(-)')
        sleep(1)
      end

      it 'housenumberは半角でないと登録できない' do
        @deal_address.housenumber = '１２３-４５６７'
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include('Housenumber is invalid. Include hyphen(-)')
        sleep(1)
      end

      it 'prefecture_idが空では登録できない' do
        @deal_address.prefecture_id = nil
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Prefecture can't be blank")
        sleep(1)
      end

      it 'prefecture_idの値が1では登録できない' do
        @deal_address.prefecture_id = 1
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Prefecture can't be blank")
        sleep(1)
      end

      it 'townが空では登録できない' do
        @deal_address.town = ''
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Town can't be blank")
        sleep(1)
      end

      it 'streetが空では登録できない' do
        @deal_address.street = ''
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Street can't be blank")
        sleep(1)
      end

      it 'phoneが空では登録できない' do
        @deal_address.phone = ''
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Phone can't be blank")
        sleep(1)
      end

      it 'phoneが9桁以下では登録できない' do
        @deal_address.phone = 123_456_789
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include('Phone is invalid')
        sleep(1)
      end

      it 'phoneが12桁以上では登録できない' do
        @deal_address.phone = 123_456_789_012
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include('Phone is invalid')
        sleep(1)
      end

      it 'phoneが全角では登録できない' do
        @deal_address.phone = '１２３４５６７８９０'
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include('Phone is invalid')
        sleep(1)
      end

      it 'tokenが空では登録できない' do
        @deal_address.token = nil
        @deal_address.valid?
        expect(@deal_address.errors.full_messages).to include("Token can't be blank")
        sleep(1)
      end

    end
  end
end
