#!//usr/bin/env ruby

#require 'utils'
require 'colorize'
require 'yaml'
require 'pp'

require 'hashie'
Hash.send :include, Hashie::HashExtensions


class Price
  attr_reader :data, :max_price, :min_price

  def initialize data
    @data = data
    @max_price = data[:campaign].budget.max_bid.to_f
    @min_price = data[:campaign].ppc.bing.min_bid.to_f
    @mean_cpc = dollars_to_cents data[:estimated_avg_cpc]
  end

  def mean
    @mean_cpc
  end

  def std_dev num=1
    (num * (Math.sqrt mean)).to_i
  end


  # Lets pretend for a bit that the bidd prices follow a standard normal
  # distribution.  In this case, we can bid a price a  $$P_{bid} = \mu+2\sigma$$ and thus
  # outbid a large number of competitors, as illustrated here
  # ![Standard normal](http://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Standard_deviation_diagram.svg/350px-Standard_deviation_diagram.svg.png)
  #
  def statistical_price
    (mean + 2*std_dev)/100.0
  end

  def algorithmic_price
    statistical_price
  end

  def bid_price
    format("%.2f", raw_bid_price)
  end

  private
    def raw_bid_price
      ensure_in_range
    end

    def ensure_in_range
      if algorithmic_price < min_price
        return min_price
      elsif (algorithmic_price >= max_price)
        return max_price - 0.10
      elsif algorithmic_price < max_price
        return algorithmic_price 
      end
    end

    def dollars_to_cents number
      (100*number[1..-1].to_f).to_i
    end 
end

CAMPAIGN_TEMPLATE =<<-END
campaign_name:
ppc:
  tier_1:
    price:
    percent: 1.00
  tier_2:
    price:
    percent: 0.75
  tier_3:
    price:
    percent: 0.50
  google:
    max_bid: 0.99
    min_bid: 0.01
  bing:
    max_bid: 0.99
    min_bid: 0.10
ppa:
  google: 
    max_bid: 1.01
    min_bid: 0.01
  bing:
    max_bid: 1.01
    min_bid: 0.10

budget:
  google: 0.50
  bing: 0.50
  max_bid:

broad_match_limit: 

daily_budget: 100.00
keyword_limit: 
keyword_click_limit:
keyword_spend_limit: 
minimum_quality_score:

info_pages: []
landing_pages: [] 
blacklist: [] 
END

def load_campaign_config
  config_file = 'campaign.yml'
  if File.exists? config_file
    $campaign = YAML.load_file(config_file).to_mash  
    puts "Campaign config has been loaded".green
  else
    File.open(config_file, 'w') {|f| f.puts CAMPAIGN_TEMPLATE }
    puts "I have just created a default campaign.yml file.  Pleases fill it in before proceeding".red
    exit
  end
end 



def price_keywords filename
  extension =  File.extname filename
  if extension.empty?
    output_filename = File.basename(filename + '.kwd')
  else
    output_filename = File.basename(filename.sub(extension, '.kwd'))
  end


  doc = File.readlines filename
  #  => [:keyword, :competition, :global_monthly_searches, :local_monthly_searches, :estimated_avg_cpc, :ad_share, :search_share] 
  headers =  doc[0].chomp.split("\t").map(&:downcase).map{|s| s.delete '.'}.map{|s| s.gsub(' ', '_')}.map(&:to_sym)

  keywords = doc.drop(1)
  f = File.open(output_filename, 'w')

  for keyword_stat in keywords
    data = Hash[headers.zip(keyword_stat.chomp.split("\t"))].merge(campaign: $campaign)
    keyword = data[:keyword]
    next if $campaign.blacklist.include? keyword
    price = Price.new data
    google_bid_price = bing_bid_price = price.bid_price
    output = "#{keyword}, #{AD_GROUP}, #{google_bid_price}, #{bing_bid_price}"#", #{data[:estimated_avg_cpc]}" 
    puts output
    f.puts output
  end 
  f.close
end 

keyword_list = ARGV[0]
AD_GROUP = ARGV[1] || "default"

load_campaign_config
price_keywords keyword_list
