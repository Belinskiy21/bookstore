class AddressesController < ApplicationController
  def index
    @addresses = AddressesForm.new(user_id: current_user.id)
  end

  def create
    @addresses = AddressesForm.new(addresses_params)
    render :index, object: @addresses.errors
  end

  def edit
    @addresses = AddressesForm.new(user_id: current_user.id)
  end

  private

  def addresses_params
    params.require(:addresses_form)
  end
end
