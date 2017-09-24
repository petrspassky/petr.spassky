class UrlWrapperFactory
  def initialize(site)
    @site = site
  end

  def build
    return BaseUrlWrapper.new if site.affiliate_program != 'ccbill'
    CcbillUrlWrapper.new(affiliate_id: site.affiliate_id,
                         webmaster_account: site.webmaster_account)
  end

  private

  attr_reader :site
end
