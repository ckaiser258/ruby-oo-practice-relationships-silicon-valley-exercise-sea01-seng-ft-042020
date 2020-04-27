require "pry"

class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name,domain)
        self.name = name
        self.domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        Startup.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        Startup.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        new_round = FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        all_rounds = []
        FundingRound.all.map do |funding_round|
            if funding_round.startup == self
                all_rounds << funding_round
            end
        end
        all_rounds.length
    end

    def total_funds
        all_investments = []
        FundingRound.all.map do |funding_round|
            if funding_round.startup == self
                all_investments << funding_round.investment
            end
        end
        all_investments.sum
    end
    
    def investors
        investors = []
        FundingRound.all.map do |funding_round|
            if funding_round.startup == self
                investors << funding_round.venture_capitalist
            end
        end
        investors.uniq
    end

    def big_investors
        biginvestors = []
        investors.map do |investor|
            if VentureCapitalist.tres_commas_club.include? investor
                biginvestors << investor
            end
        end
        biginvestors.uniq
    end

end