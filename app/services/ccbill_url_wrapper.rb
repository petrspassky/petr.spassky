class CcbillUrlWrapper < BaseUrlWrapper
  BASE_URL = 'http://refer.ccbill.com/cgi-bin/clicks.cgi'.freeze

  def initialize(affiliate_id:, webmaster_account:)
    @affiliate_id = affiliate_id
    @webmaster_account = webmaster_account
  end

  def wrap(url)
    URI(BASE_URL).tap do |uri|
      uri.query = URI.encode_www_form(query_params(url))
    end.to_s
  end

  private

  attr_reader :affiliate_id, :webmaster_account

  def query_params(url)
    {
      CA: webmaster_account,
      PA: affiliate_id,
      html: "#{url}?affid=#{affiliate_id}"
    }
  end
end
