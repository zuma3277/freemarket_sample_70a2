require 'rails_helper'
RSpec.describe User, type: :model do

  it "emailがない場合は登録できないこと" do
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 
  end 
  
end

