class CcbillUrlWrapper
  BASE_URL = 'http://refer.ccbill.com/cgi-bin/clicks.cgi'.freeze

  def initialize(affiliate_id:, webmaster_account:, url:)
    @affiliate_id = affiliate_id
    @webmaster_account = webmaster_account
    @url = url
  end

  def perform
    URI(BASE_URL).tap do |uri|
      uri.query = URI.encode_www_form(query_params)
    end.to_s
  end

  private

  attr_reader :affiliate_id, :webmaster_account, :url

  def query_params
    {
      CA: webmaster_account,
      PA: affiliate_id,
      html: "#{url}?affid=#{affiliate_id}"
    }
  end
end
