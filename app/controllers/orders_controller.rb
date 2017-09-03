class OrdersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

  http_basic_authenticate_with name: "admin", password: "hunter", only: :index

  def index
    @orders = Order.all
  end

	def create
		@order = Order.new(params.require(:order).permit!)
		@order.save

		redirect_to '/ty.html'
	end

end
