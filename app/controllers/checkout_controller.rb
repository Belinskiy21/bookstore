class CheckoutController < ApplicationController
  include Wicked::Wizard
  steps :addresses, :delivery, :payment, :confirm, :complete

  def show
  render_wizard
  end
end
