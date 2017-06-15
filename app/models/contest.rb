class Contest < ActiveRecord::Base
  belongs_to :contest_type

  validates :contest_type_id, presence: true
  validates :away_contestant, presence: true
  validates :home_contestant, presence: true
  validates :away_strength, presence: true
  validates :home_strength, presence: true
  validates :away_intelligence, presence: true
  validates :home_intelligence, presence: true

  enum status: { in_queue: 0, in_progress: 1, finished: 2 }


  def self.get_pets
  	require "net/http"
  	require 'net/https'
    require "uri"

    uri = URI.parse("https://wunder-pet-api-staging.herokuapp.com/pets")
	  https = Net::HTTP.new(uri.host,uri.port)
	  https.use_ssl = true
	  req = Net::HTTP::Get.new(uri.path, initheader = {'Content-Type' =>'application/json', "X-Pets-Token" =>"UXhygiNEP1vYvRuPA4EluyJxLnscJ6uerTsUlnObFUqKxoyCnN"})

	  res = https.request(req)

    return JSON.parse(res.body)
  end


  def strength_test
  	if away_strength == home_strength
  		tie_breaker
  	elsif away_strength > home_strength
  		self.winner = self.away_contestant
      self.status = 2
      self.save
  	else
  		self.winner = self.home_contestant
      self.status = 2
      self.save
  	end	
  end

  def intelligence_test
  	if away_intelligence == home_intelligence
  		tie_breaker
  	elsif away_intelligence > home_intelligence
  		self.winner = self.away_contestant
      self.status = 2
      self.save 
  	else
  		self.winner = self.home_contestant
      self.status = 2
      self.save 
  	end
  end

  def tie_breaker
  	num = rand(1..10)
    self.status = 2

  	if num < 6
  		self.winner = self.home_contestant
  	else
  		self.winner = self.away_contestant
  	end

  	self.save
  end

end