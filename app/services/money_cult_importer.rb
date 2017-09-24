class MoneyCultImporter
  PERIODS = [
    ALL = 0,
    LAST = 1,
    WEEK = 2,
    THIRTY_DAYS = 3,
    SIXTY_DAYS = 4,
    NINETY_DAYS = 5
  ].freeze
  BASE_URL = 'http://www.moneycult.com/cgi-bin/fhgmanager/manager.cgi'.freeze
  LOGIN = 'xMamrGNhG9'.freeze
  PASSWORD = 'Bir5enqM6g'.freeze
  LISTKEYS = %w[15-22-0 15-22-1 15-27-0 15-27-1 15-29-1 15-30-1
                16-22-0 16-27-0
                19-22-0 19-22-1 19-27-0 19-27-1 19-29-1 19-30-1].freeze

  def initialize(period: ALL, listkeys: LISTKEYS)
    @period = period
    @listkeys = listkeys
  end

  def perform
    listkeys.each do |listkey|
      data = receive_data(listkey)
      csv_data = extract_csv(data)
      MoneyCultParser.new(csv_data).perform
    end
  end

  private

  attr_reader :period, :listkeys

  def receive_data(listkey)
    uri = URI(BASE_URL)
    query_params = params(listkey)
    uri.query = URI.encode_www_form(query_params)
    Net::HTTP.get_response(uri).body
  end

  def params(listkey) # rubocop:disable MethodLength
    {
      module: 'basic',
      l: '1',
      mode: '0',
      wizardstep: '0',
      wizard: '0',
      scid: '0',
      vid: '0',
      algn: '2',
      data1: '1',
      data2: '2',
      data3: '3',
      data4: '4',
      data5: '5',
      data6: '6',
      data7: '7',
      data8: '8',
      data9: '9',
      delimiter: ';',
      selpage: '10000',
      period: period,
      listkey: listkey,
      sida: sida
    }
  end

  def sida
    @sida ||= begin
      resp = Net::HTTP.post_form(URI(BASE_URL), login_params)
      resp['Set-Cookie'].match(/sida=([^;]+);/)[1]
    end
  end

  def login_params
    {
      module: 'login',
      uname: LOGIN,
      pass: PASSWORD
    }
  end

  def extract_csv(html_data)
    csv_data = (Nokogiri::HTML(html_data) / 'textarea')[0].inner_html.strip
    CGI.unescapeHTML(csv_data)
  end
end
