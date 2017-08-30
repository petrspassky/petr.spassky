puts 'Seeding models'

models_data = [
  {
    site: 'Femjoy',
    name: 'Elvira U.',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=https://femjoy.com/models/elvirau?affid=2588917'
  },
  {
    site: 'Femjoy',
    name: 'Sabrina G.',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=https://femjoy.com/models/sabrinag?affid=2588917'
  },
  {
    site: 'Femjoy',
    name: 'Stella P.',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=https://femjoy.com/models/stellap?affid=2588917'
  },
  {
    site: 'Femjoy',
    name: 'Rena',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=https://femjoy.com/models/rena?affid=2588917'
  },
  {
    site: 'Femjoy',
    name: 'Niemira',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=https://femjoy.com/models/niemira?affid=2588917'
  }
]

models_data.each do |data|
  site_title = data.delete(:site)
  site = Site.find_by title: site_title

  model_name = data.delete(:name)
  model = Model.create!(name: model_name)

  model.site_models.create!(
    site: site,
    model: model,
    nickname: model_name,
    url: data[:url]
  )
end
