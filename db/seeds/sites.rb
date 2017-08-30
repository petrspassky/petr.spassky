puts 'Seeding sites'

sites_data = [
  {
    title: 'Femjoy',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=http://femjoy.com/'
  },
  {
    title: 'Amour Angels',
    url: 'http://amourangels.com/'
  }
]

Site.create!(sites_data)
