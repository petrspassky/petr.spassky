class BellaCashImporter
  # TODO: move to config
  GENLIST_URL = 'http://www.bellacash.com/genlist.php'.freeze
  AFFILIATE_ID = '2589061'.freeze

  def perform
    html_data = Net::HTTP.post_form(URI(GENLIST_URL), params).body
    data = extract_csv(html_data)
    BellaCashParser.new(data).perform
  end

  private

  def params # rubocop:disable Metrics/MethodLength
    {
      ccbill: AFFILIATE_ID,
      paysite: 'all',
      type: 'all',
      imagedisplay: 'normal',
      ex1: 'gallerylink',
      ex2: ';',
      ex3: 'gallerydesc',
      ex4: ';',
      ex5: 'sitename',
      ex6: ';',
      ex7: 'paysitelink',
      ex8: ';',
      ex9: 'dateadded',
      ex10: 'blank'
    }
  end

  def extract_csv(html_data)
    body_data = (Nokogiri::HTML(html_data) / 'body').inner_html.strip
    CGI.unescapeHTML(body_data.gsub('<br>', "\n"))
  end
end
