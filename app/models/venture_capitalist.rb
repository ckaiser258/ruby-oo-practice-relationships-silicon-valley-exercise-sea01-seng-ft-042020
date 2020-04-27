class VentureCapitalist
    attr_accessor :name, :total_worth
    
    @@all = []

    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 100000000
        end
    end

    def offer_contract(startup, type, investment)
        contract = FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        startups = []
        FundingRound.all.map do |funding_round|
            if funding_round.venture_capitalist == self
                startups << funding_round.startup
            end
        end
        startups.uniq
    end

    def biggest_investment
        most = 0
        funding_rounds.map do |funding_round|
            if funding_round.investment > most
                most = funding_round.investment
            end
        end
        funding_rounds.map do |funding_round|
            if most == funding_round.investment
                return funding_round
            end
        end
    end

    def invested(domain) #returns sum of ALL the investments for specified domain
        total = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup.domain == domain
                total += funding_round.investment
            end
        end
        total
    end

    #     FundingRound.all.select {|funding_round| funding_round.startup.domain == domain}.reduce(0) do |total, funding_round|
    #          total += funding_round.investment
    #         total
    #     end

    #     FundingRound.all.select {|round| round.startup.domain == domain}.reduce({}) do |acc, ele|
    #         acc[ele.some_info] = ele.some_other_info
    #        acc
    #    end
    # end
end