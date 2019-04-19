class WeatherforecastWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    # get all airports
    # Location.all
    # loop through all to get unique [:airport] codes
    # request non-stop flights for 1 week from date
    # keys should be in format "SFO:nonstop:20190501" => code:name:DATE
    # if key already exists, skip function
    
  end
end
