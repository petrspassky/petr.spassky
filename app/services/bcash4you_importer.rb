class Bcash4youImporter
  # TODO: move to config
  LOGIN_URL = 'http://www.bcash4you.com/'.freeze
  CSV_URL = 'http://www.bcash4you.com/promotion/watch4beauty.com/fhg.csv'.freeze
  AFFILIATE_ID = '2589044'.freeze

  def perform
    data = receive_data
    Bcash4youParser.new(data).perform
  end

  private

  def receive_data
    uri = URI(CSV_URL)
    req = Net::HTTP::Get.new(uri)
    req['Cookie'] = cookies
    Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }.body
  end

  def content_path
    '/'
  end

  def cookies
    @cookies ||= begin
      resp = Net::HTTP.post_form(URI(LOGIN_URL), login_params)
      resp['Set-Cookie'].match(/(PHPSESSID=[^;]+);/)[1]
    end
  end

  def login_params
    {
      username: AFFILIATE_ID,
      loginsent: 1
    }
  end
end
