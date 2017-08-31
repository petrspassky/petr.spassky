class AlbumDecorator < Draper::Decorator
  delegate_all

  def date
    object.date.to_s(:long)
  end

  def affiliated_url
    CcbillUrlWrapper.new(
      affiliate_id: object.affiliate_id,
      webmaster_account: object.webmaster_account,
      url: object.url
    ).perform
  end

  def affiliated_site_url
    CcbillUrlWrapper.new(
      affiliate_id: object.affiliate_id,
      webmaster_account: object.webmaster_account,
      url: object.site_url
    ).perform
  end
end
