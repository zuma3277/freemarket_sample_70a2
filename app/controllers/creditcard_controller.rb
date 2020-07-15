class CreditcardController < ApplicationController
  #PAYJPとやり取りするために、payjpをロード
  require "payjp"

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    
    if params["payjp-token"].blank?
      redirect_to action: "new"
    else
      # 生成したトークンから、顧客情報と紐付け、PAY.JP管理サイトに登録
      customer = Payjp::Customer.create(
        card: params["payjp-token"],
        metadata: {user_id: current_user.id}
      )
      # 今度はトークン化した情報を自アプリのCredit_cardsテーブルに登録
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      # 無事、トークン作成とともにcredit_cardsテーブルに登録された場合、createビューが表示されるように条件分岐
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      customer_card = customer.cards.retrieve(card.card_id)
      @card_brand = customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "logo_visa.gif"
      when "JCB"
        @card_src = "jcb-logomark-img-01.gif"
      when "MasterCard"
        @card_src = "mc_vrt_opt_pos_46_2x.png"
      when "American Express"
        @card_src = "amex-logomark-img-04.gif"
      when "Diners Club"
        @card_src = "diners-logomark-img-01.gif"
      when "Discover"
        @card_src = "discover-logomark-img-08.gifg"
      end
    end
  end
end