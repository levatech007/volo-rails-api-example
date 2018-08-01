class EmailListController < ApplicationController

  def create
    #post email to mailing list in Mailchimp
    p(params[:email])
    #save email to db
    @subscription = Mailchimp.new(params[:email])
    @subscription.subscribe()
  end

end
