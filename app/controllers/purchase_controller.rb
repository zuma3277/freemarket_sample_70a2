class PurchaseController < ApplicationController
  require 'payjp'

  def index
    #@products = Products.find(params[:product_id])
    @post_address =  current_user.city + current_user.address
    @post_name = current_user.destination_family_name + current_user.destination_first_name
    card = CreditCard.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "creditcard", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
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

  def done
  end


  def pay
    #@products = Products.find(params[:id])
    card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    amount: 13500, #@products.price
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    redirect_to  done_purchase_index_path #完了画面に移動
  end
  
  # private

  # def products_params
  #   params.require(:product).permit(
  #     :name,
  #     :price,
  #   ).merge(user_id: current_user.id)
  # end
end