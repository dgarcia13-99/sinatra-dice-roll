require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/koala") do
  "yay!!!"
end

get("/dice/2/6") do
  @rolls=[]

  2.times do
  die = rand(1..6)
  @rolls.push(die)
  sum += die
end
	
  #@outcome_2_6 = "You rolled a #{@rolls[0]} and a #{@rolls[1]} for a total of #{sum}."
	
  erb(:two_six)
end

get ("/dice/2/10") do
  @rolls=[]

  2.times do
    die=rand(1..10)
    @rolls.push(die)
  end

  #@outcome_2_10="You rolled a #{first} and a #{second}, resulting in a total sum of #{sum}."

  erb(:two_ten)
end

get ("/dice/1/20") do
  @dice=rand(1..20)
  #@outcome_1_20="You rolled a #{@dice}."

  erb(:one_twenty)
end

get ("/dice/5/4") do
  @rolls=[]

  5.times do 
    die=rand(1..4)
    @rolls.push(die)
  end

  #@outcome_5_4="You rolled a #{first}, a #{second}, a #{third}, a #{fourth}, and a #{fifth}, resulting in a total sum of #{sum}."

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls=[]
  100.times do
    die= rand(1..6)
    @rolls.push(die)
  end

  erb(:one_hundred_six)

end
