class Dashboard::ItemsController < Dashboard::BaseController
  def index
    @user = current_user
  end

  def disable
    binding.pry
    @item = Item.find(params[:item_id])
    @item.enabled = false
    @item.save
    flash[:notice] = "Item has been disabled"
    redirect_to dashboard_items_path
  end

  def enable
    @item = Item.find(params[:item_id])
    @item.enabled = true
    @item.save
    flash[:notice] = "Item account has been enabled"
    redirect_to dashboard_items_path
  end
end
