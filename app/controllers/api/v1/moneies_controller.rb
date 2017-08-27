class Api::V1::MoneiesController < ApplicationController
  def index
    @moneies = Money.all
    render json: @moneies
  end

  def show
    @money = Money.find(params[:id])
    render json: @money
  end

  def create
    @money = Money.new(money_params)

    respond_to do |format|
      if @money.save
        format.json { render json: @money }
      else
        format.json { render json: @money.errors, status: :bad_request }
      end
    end
  end

  private

  def money_params
    params.require(:money).permit(:price, :saved_at)
  end
end
