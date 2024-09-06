require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  "<h1>Dice Roll</h1>
  <body>
    <div>
      <ul>
        <li><a href=\"https://sturdy-eureka-q79pxgggxx9rc4vqj-4567.app.github.dev/dice/2/6\"> Roll two six-sided dice</a></li>
        <li><a href=\"https://sturdy-eureka-q79pxgggxx9rc4vqj-4567.app.github.dev/dice/2/10\"> Roll two ten-sided dice</a></li>
        <li><a href=\"https://sturdy-eureka-q79pxgggxx9rc4vqj-4567.app.github.dev/dice/1/20\"> Roll one twenty-sided dice</a></li>
        <li><a href=\"https://sturdy-eureka-q79pxgggxx9rc4vqj-4567.app.github.dev/dice/5/4\"> Roll five four-sided dice</a></li>
      </ul>
    </div>
  </body>"
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
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get ("/dice/2/10") do
  first=rand(1..10)
  second=rand(1..10)
  sum=first+second

  answer="You rolled a #{first} and a #{second}, resulting in a total sum of #{sum}."

  "<h1>2d10</h1>
  <p>#{answer}</p>"
end

get ("/dice/1/20") do
  dice=rand(1..20)
  final_answer="You rolled a #{dice}."

  "<h1>1d20</h1>
  <p>#{final_answer}</p>"
end

get ("/dice/5/4") do
  first=rand(1..4)
  second=rand(1..4)
  third=rand(1..4)
  fourth=rand(1..4)
  fifth=rand(1..4)
  sum=first+second+third+fourth+fifth

  outcome="You rolled a #{first}, a #{second}, a #{third}, a #{fourth}, and a #{fifth}, resulting in a total sum of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
