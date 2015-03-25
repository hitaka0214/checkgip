# -- coding: utf-8

require "open-uri"
require "nokogiri"
require "ipaddr"
require "faraday"

# 確認くんのURL
url = "http://www.ugtop.com/spill.shtml"
doc = Nokogiri::HTML(open(url))

# IPアドレスを取得
gip = doc.xpath('//tr[4]/td[2]/p/font').text

# IPアドレスの形式でなければエラー
if ( IPAddr.new(gip) ).ipv4? or ( IPAddr.new(gip).ipv6? )
  ;;
else
  puts "ERROR this is not ipaddress = #{gip}"
  exit 1
end
p gip

# ChatWorkへ通知
ROOM_ID = ''
CHATWORK_TOKEN = ''

conn = Faraday::Connection.new(url: "https://api.chatwork.com") do |builder|
  builder.use Faraday::Request::UrlEncoded
  builder.use Faraday::Response::Logger
  builder.use Faraday::Adapter::NetHttp
end

response = conn.post do |request|
  request.url "/v1/rooms/#{ROOM_ID}/messages"
  request.headers = {
    'X-ChatWorkToken' => CHATWORK_TOKEN
  }
  request.params[:body] = "[info]#{gip}[/info] is global ipaddress at my home."
end
