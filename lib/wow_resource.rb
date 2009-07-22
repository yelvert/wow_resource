class WowResource
  require 'rubygems'
  require 'hpricot'
  require 'open-uri'
  require 'benchmark'
  
  @@base_url = "http://www.wowarmory.com"
  @@storage_path = "#{RAILS_ROOT}/wowplugin_storage"
  
  cattr_accessor :base_url, :storage_path
  
  def self.base_url
    @@base_url
  end
  
  def self.fetch_xml(doc, params = {})
    url = "#{base_url}/#{doc}?"
    args = []
    params.each_pair do |k,v|
      args << "#{k}=#{URI.escape(v.to_i)}"
    end
    url << args.join("&")
    xml = Hpricot.XML(WowResource.http_fetch(url))
    xml
  end
  
  def self.http_fetch(url, limit = 10)
    # You should choose better exception.
    raise ArgumentError, 'HTTP redirect too deep' if limit == 0
    
    request = Net::HTTP::Get.new(url)
    request["user-agent"] = "Mozilla/5.0 Gecko/20070219 Firefox/2.0.0.2"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request request
    
    case response
    when Net::HTTPSuccess then response.body
    when Net::HTTPRedirection then WowResource.http_fetch(response['location'], limit-1)
    else
      response.error!
    end
  end
    
end