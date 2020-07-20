require 'rails_helper'
describe Product do

  it "nameがない場合は登録できないこと" do
    expect(FactoryBot.build(:product, name: "")).to_not be_valid 
  end
  
  it "product_introductionがない場合は登録できないこと" do
    expect(FactoryBot.build(:product, product_introduction: "")).to_not be_valid 
  end

  it "size_idがない場合は登録できないこと" do
    expect(FactoryBot.build(:product, size_id: "")).to_not be_valid 
  end

  it "category_idがない場合は登録できないこと" do
    expect(FactoryBot.build(:product, category_id: "")).to_not be_valid 
  end

  it "product_condition_idがない場合は登録できないこと" do
    expect(FactoryBot.build(:product, product_condition_id: "")).to_not be_valid 
  end

  it "priceがない場合は登録できないこと" do
    expect(FactoryBot.build(:product, price: "")).to_not be_valid 
  end

  it "priceが299以下の場合は登録できないこと" do
    expect(FactoryBot.build(:product, price: "299")).to_not be_valid 
  end

end