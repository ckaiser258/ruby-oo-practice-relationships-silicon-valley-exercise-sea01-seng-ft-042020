require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
hi = Startup.new("hi","jimmy","apple")
hello = Startup.new("hello","tim","microsoft")

colton = VentureCapitalist.new("Colton",1000000000)
christina = VentureCapitalist.new("Christina", 1000000000)
joe = VentureCapitalist.new("Joe", 1000000)

round1 = FundingRound.new(hi, colton, "Angel", 200000)
round2 = FundingRound.new(hello, joe, "Seed", 100000)
round3 = FundingRound.new(hi, christina, "Seed", 100000)
round4 = FundingRound.new(hello, colton, "Series 1", 400000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line