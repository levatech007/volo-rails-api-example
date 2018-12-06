# VOLO - the app for plane spotters (API)

Volo (Italian for flight) is an app for plane spotters. You can find information about plane spotting locations around the world with user reviews of each location. The app also lets you create an account, check weather forecast for chosen location as well as add a select day to your calendar.

![Wireframes](/images/volo-homepage.png)


### Technologies:
The following technologies made it possible:

Front end:
- React.js
- Bootstrap 4.0
- Popper.js 1.12.9
- jQuery
- J-toker (for authentication)
- React Stars
- React Google Map

Back end:
- Rails
- Redis
- Sidekiq
- PostgreSQL
- RestClient
- Devise Token Auth
- CarrierWave 

3rd Party APIs:
- Openweathermap
- Mailchimp

### Links:

- Front end app [Github](https://github.com/levatech007/volo-react-app)
- Front end app [Heroku](https://volo-app.herokuapp.com)

- Back end app [Github](https://github.com/levatech007/volo_rails_api)
- Back end app [Heroku](https://volo-rails-api.herokuapp.com)

## Installation:

To install dependencies on the front end, run:
`npm install`

To install dependencies on the back end, run:
`bundle install`

## User Stories:
- Users can create an account and login.

![Wireframes](/images/login-page.png)

- Users can select a plane spotting location and see information about that locations, including a map.
- Users can read other users reviews of the location as well as post their own review.

![Wireframes](/images/locations-menu-page.png)

![Wireframes](/images/location-page.png)

![Wireframes](/images/location-review-page.png)

- Users can select a location and see weather forecast for the next 4 days.
- Users can add a day to their calendar with weather information as well as add notes prior to saving their selection.

![Wireframes](/images/calendar-page.png)

## Wireframes

![Wireframes](/images/wireframes.JPG)

## ERD
![Wireframes](/images/ERD.png)

## Unsolved Problems in BE:
- Routes don’t have authorization.
- Password change is not functional beyond receiving password reset email.
- Weather data is duplicated in Heroku.
-

## Future Features:
- Airport information with flight schedules.
- Nearby flights on map, real time.
- Selecting locations based on type of plane user wants to see as well as by busiest times at given airport.
- More detailed location info (parking, nearby amenities).
- Schedules of airshows.
