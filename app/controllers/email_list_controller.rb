class EmailListController < ApplicationController

  def create
    @subscription = Mailchimp.new(params[:email])
    @subscription.subscribe()
  end

end
