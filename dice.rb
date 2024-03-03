# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "
  <h1> Dice Roll </h1>
  <div class=\"dice-rolls\" style=\"display: flex; flex-direction:column\">
    <a href=\"/dice/2/6\"> Roll two 6-sided dice </a>
    <a href=\"/dice/1/20\"> Roll one 20-sided dice </a>
    <a href=\"/dice/5/4\"> Roll five 4-sided dice </a>
  </div>
  "
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(2..6)

  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "
  <h1>2d6</h1>
  <p>#{outcome}</p>
  "
end

get("/dice/2/10") do
  first = rand(1..10)
  second = rand(1..10)

  sum = first + second
  out = "You rolled a #{first} and a #{second} for a total of #{sum}."

  "
  <h1>2d10</h1>
  <p>#{out}</p>
  "
end 

get("/dice/1/20") do
  first = rand(1..20)

  out = "You rolled a #{first} for a total of #{first}."

  "<h1>1d20</h1>
  <p>#{out}</p>
  "
end

get("/dice/5/4") do
  first = rand(1..4)
  second = rand(1..4)
  third = rand(1..4)
  fourth = rand(1..4)
  fifth = rand(1..4)

  sum = first + second + third + fourth + fifth
  out = "You rolled a #{first} and a #{second} and a #{third} and a #{fourth} and a #{fifth} for a total of #{sum}."

  "
  <h1>5d4</h1>
  <p>#{out}</p>
  "
end 
