# EV Station Finder - Frontend
[EV Station Finder](https://ev-station-finder-frontend.herokuapp.com/) allows users to find the nearest charging station for their electric vehicle. And to help them prepare, users will also see a 10-hour forecast in the station’s page. 
The guest user is able to utilize EV Station Finder with ease. A guest user can provide a location in the following ways:

  - zip code
  - full address
  - city and state
    
Additionally, the guest user can create an account for some added features:
  - Save favorite stations for easy access
  - Get step-by-step directions to the station (coming soon)

#### Acknowledgements
  
This app utilizes data from the [EV Station Finder - Backend](https://github.com/EV-Station-Finder/ev_station_finder_be) which aggregates data from [NREL](https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/) and [OpenWeather](https://openweathermap.org/api) external APIs.

### Authors
- Alexander Brueck | [GitHub](https://github.com/brueck1988) | [LinkedIn](https://www.linkedin.com/in/brueck1988/)
- Diana Buffone | [GitHub](https://github.com/Diana20920) | [LinkedIn](https://www.linkedin.com/in/dianabuffone/)

## Table of Contents
  - [Built With](#built-with)
  - [Getting Started](#getting-started)
  - [Usage](#usage)
  - [Running the tests](#running-the-tests)
  - [Contributing](#contributing)

## Built With

* [Ruby on Rails](https://rubyonrails.org)
* [RSpec](https://github.com/rspec/rspec-rails)
* [PostgreSQL](https://www.postgresql.org/)

#### Continuous Integration
- [CircleCI](https://circleci.com)

#### Deployed With
- [Heroku](https://www.heroku.com/)

#### Gems Used
- [Faraday](https://github.com/lostisland/faraday)
- [Capybara](https://github.com/teamcapybara/capybara)
- [Shouldamatchers](https://github.com/thoughtbot/shoulda-matchers)
- [Webmock](https://github.com/bblimke/webmock)
- [VCR](https://github.com/vcr/vcr)
- [Pry](https://github.com/pry/pry)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [Fast JSON API](https://github.com/Netflix/fast_jsonapi)
- [BCrypt](https://github.com/pyca/bcrypt)
- [Figaro](https://github.com/laserlemon/figaro)
- [Rubocop](https://github.com/rubocop/rubocop)
- [Launchy](https://github.com/OpenNingia/Launchy)


## Getting Started

**Prerequisites:** To run this application you will need Ruby 2.5.3 and Rails 5.2.6

To get a local copy up and running follow these simple steps:
1. Fork this repo
2. Clone your forked repo to your local machine
   ```sh
   git clone <git@github.com:EV-Station-Finder/ev_station_finder_fe.git>
   ```
3. Install gem packages
   ```sh
   bundle install
   ```

## Usage
   1. Create rails database and migrate
       ```sh
        rails db:{create,migrate}
       ```
   2. Start rails server
       ```sh
       rails s
       ```
   3. Nagivate to `http://localhost:3000/`

## Contributing

   Contributions are welcome! And they are *sincerely appreciated*.

   1. Fork the Project
   2. Create your Feature Branch (`git checkout -b feature/<your feature name>`)
   3. Commit your Changes (`git commit -m 'Add feature'`)
   4. Push to the Branch (`git push origin feature/<your feature name>`)
   5. Open a Pull Request

**************************************************************************
##### Project Started: 2021/08/21
**[Back to top](#table-of-contents)**
