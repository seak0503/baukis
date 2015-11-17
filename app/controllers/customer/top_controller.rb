class Customer::TopController < ApplicationController
  skip_before_action :authorize

  def index
    render action: 'index'
  end
end
