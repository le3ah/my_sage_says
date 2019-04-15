
[![Waffle.io - Columns and their card count](https://badge.waffle.io/le3ah/my_sage_says.svg?columns=all)](https://waffle.io/le3ah/my_sage_says)

# README

My Sage Says is my final solo take-home challenge in Module 4 of 4 at the Turing School of Software & Design.

The project lasted 5 days and includes the following tech: Ruby on Rails & PostgreSQL.

My Sage Says focuses on API consumption, consuming the APIs from https://api.adviceslip.com/.  

#### [**_View My Sage Says in Production_**](http://vast-ridge-78927.herokuapp.com/)

## Getting Started

To run My Sage Says on your local machine, navigate to the directory in which you would like the project to be located, then execute the following commands:

```
$ git clone git@github.com:le3ah/my_sage_says.git
$ cd my_sage_says
$ bundle
$ rails g rspec:install
$ rails db:create
$ rails db:migrate
```

In order to see that the backend data is working appropriately, take the rails server for a spin!  Just type `rails s` in your terminal, and you should be able to find our backend APIs at http://localhost:3000

## Testing
I ran my tests using `rspec` and followed my coverage with SimpleCov.  When I first run my tests in a 24-hour period, the test coverage is at 100%.  Because of the low-level caching I implemented, my test coverage will drop after I run it the first time in that 24-hour period.

<img width="1389" alt="Screen Shot 2019-04-15 at 2 44 10 PM" src="https://user-images.githubusercontent.com/42391567/56164008-0460f000-5f8d-11e9-8d98-7e48811db7f7.png">


## Code Snippets
In order to keep my views light, I did implement the use of an Advice Facade:
```
class AdviceFacade

  def query_advice(params)
    advice = AdviceService.new.slip_query(params["recent_dream"])
    if advice[:slips]
      advice[:slips].map do |slip|
        slip[:advice]
      end
    else
      advice[:message][:text]
    end
  end

  def random_generator
    AdviceService.new.random_advice[:slip][:advice]
  end

  def advice_by_number(params)
    advice = AdviceService.new.slip_id(params["favorite_number"])
    if advice[:slip]
      advice[:slip][:advice]
    else
      advice[:message][:text]
    end
  end
end
```
I used low-level caching for my `Advice Service` for the search functionality by query string and number:
```
def slip_query(query)
  Rails.cache.fetch("advice_query_#{query}", expires_in: 1.day) do
    response = conn.get("/advice/search/#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
```

## Rubric/Project Description
http://backend.turing.io/module4/projects/take_home_challenge/take_home_challenge_rubric

## Author

* [Leah K. Miller](https://github.com/le3ah)
