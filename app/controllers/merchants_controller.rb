class MerchantsController < ApplicationController
  def index
    @active_merchants = User.where(role: 1).where(enabled: true)
    @all_merchants = User.where(role: 1)
  end

  def edit
    @merchant = User.find(params[:id])
  end
end
