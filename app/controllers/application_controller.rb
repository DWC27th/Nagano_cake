class ApplicationController < ActionController::Base

  def shop_item_genre_enable?  #取得した商品に紐づくジャンルステータスが無効な場合rootへ遷移
    @shop_item = ShopItem.find(params[:id])
    @genre = Genre.find(@shop_item.genre_id)
    if @genre.published_status == "無効"
      redirect_to root_path
    end
  end

  def shop_item_enable?  #取得した商品の販売ステータスが販売停止中の場合rootへ遷移
    @shop_item = ShopItem.find(params[:id])
    if @shop_item.sale_status == "販売停止中"
      redirect_to root_path
    end
  end

end