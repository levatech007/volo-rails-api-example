class Mailchimp
  require 'base64'
  require 'json'

  def initialize(email)
    @email = email
  end

  def subscribe
    p("here we go!")
    auth = Base64.encode64("volo:#{ENV['MC_API_KEY']}")
    data = { email_address: @email, status: 'subscribed' }
    response = RestClient::Request.execute(
      method: :post,
      url: "https://us18.api.mailchimp.com/3.0/lists/#{ENV['MC_LIST_ID']}/members",
      user: 'volo',
      password: "#{ENV['MC_API_KEY']}",
      payload: data.to_json,
      headers: { Authorization: auth, content_type: 'application/json' }
    )
  end

end
