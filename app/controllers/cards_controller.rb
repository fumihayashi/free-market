class CardsController < ApplicationController

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]

    customer = Payjp::Customer.create(card: params[:payjp_token]) ## 顧客の作成

    card = current_user.build_card(card_token: params[:card_token], customer_token: customer.id)
    if card.save
      redirect_to cards_path, notice: "カードの登録が完了しました。"
    else
      redirect_to new_card_path, alert: "カードの登録に失敗しました。"
    end
  end

  def new
    @card = Card.new
    ## @exp_yearなどの定義がある場合はそのままにしておくこと
  end
end
