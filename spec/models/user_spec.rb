require 'rails_helper'
describe User do
  describe "#configure_permitted_parameters" do
    it "nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthday,destination_family_name,destination_first_name,destination_family_name_kana,destination_first_name_kana,postal_code,prefecture,city,addressが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "重複したnicknameが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("はすでに存在します")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "passwordが7文字未満であれば登録できないこと" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user).to be_valid
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaが全角カタカナでない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナで入力して下さい")
    end
    it "first_name_kanaが全角カタカナである場合は登録できること" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user).to be_valid
    end
    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
    it "family_name_kanaが全角カタカナでない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力して下さい")
    end
    it "family_name_kanaが全角カタカナである場合は登録できること" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user).to be_valid
    end
    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, post_code: "")
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end
    it "postal_codeが7桁未満の場合は登録できないこと" do
      address = build(:address, post_code: "123456")
      address.valid?
      expect(address.errors[:post_code]).to include("はハイフンなしで、半角数字で7桁入力して下さい")
    end
    it "postal_codeが8桁以上の場合は登録できないこと" do
      address = build(:address, post_code: "12345678")
      address.valid?
      expect(address.errors[:post_code]).to include("はハイフンなしで、半角数字で7桁入力して下さい")
    end
    it "postal_codeが7桁の場合は登録できること" do
      address = build(:address, post_code: "8000022")
      expect(address).to be_valid
    end
    it "postal_codeが半角数字でない場合は登録できないこと" do
      address = build(:address, post_code: "１２３４５６７")
      address.valid?
      expect(address.errors[:post_code]).to include("はハイフンなしで、半角数字で7桁入力して下さい")
    end
    it "postal_codeが半角数字である場合は登録できること" do
      address = build(:address, post_code: "8000022")
      expect(address).to be_valid
    end
    it "prefictureがない場合は登録できないこと" do
      address = build(:address, preficture: "")
      address.valid?
      expect(address.errors[:preficture]).to include("を入力してください")
    end
    it "prefictureが含まれているprefictureは登録できること" do
      address = build(:address, preficture: "東京都")
      expect(address).to be_valid
    end
    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
    it "addressがない場合は登録できないこと" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end
    it "building_nameがなくても登録できること" do
      address = build(:address, building_name: "")
      expect(address).to be_valid
    end
    it "phone_numberがなくても登録できること" do
      address = build(:address, phone_number: "")
      expect(address).to be_valid
    end
  end
end