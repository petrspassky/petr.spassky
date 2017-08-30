puts 'Seeding albums'

site = Site.find_by title: 'Femjoy'

albums_data = [
  {
    site: site,
    title: 'Explicit',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=http://hosted.femjoy.com/galleries/15724532_bpf413_cok775?affid=2588917',
    cover_url: 'http://n4.femjoy.com/updates/15724532_bpf413_cok775/cover2_384x384.jpg',
    date: '2017-08-25',
    model_nickname: 'Elvira U.'
  },
  {
    site: site,
    title: 'I Love To Be Naked',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=http://hosted.femjoy.com/galleries/16236623_ksj946_vrc514?affid=2588917',
    cover_url: 'http://n4.femjoy.com/updates/16236623_ksj946_vrc514/cover2_384x384.jpg',
    date: '2017-08-25',
    model_nickname: 'Sabrina G.'
  },
  {
    site: site,
    title: 'Come To Me',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=http://hosted.femjoy.com/galleries/16506031_bgn742_qty425?affid=2588917',
    cover_url: 'http://n4.femjoy.com/updates/16506031_bgn742_qty425/cover2_384x384.jpg',
    date: '2017-08-25',
    model_nickname: 'Stella P.'
  },
  {
    site: site,
    title: 'Field Of Gold',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=http://hosted.femjoy.com/galleries/13560375_vrk240_yrc069?affid=2588917',
    cover_url: 'http://n4.femjoy.com/updates/13560375_vrk240_yrc069/cover2_384x384.jpg',
    date: '2017-08-25',
    model_nickname: 'Rena'
  },
  {
    site: site,
    title: 'Xxx',
    url: 'http://refer.ccbill.com/cgi-bin/clicks.cgi?CA=927141-0000&PA=2588917&html=http://hosted.femjoy.com/galleries/16430316_qys461_vvn899?affid=2588917',
    cover_url: 'http://n4.femjoy.com/updates/16430316_qys461_vvn899/cover2_384x384.jpg',
    date: '2017-08-25',
    model_nickname: 'Niemira'
  }
]

albums_data.each do |album_data|
  nickname = album_data.delete(:model_nickname)
  site_model = site.site_models.find_by!(nickname: nickname)
  album = Album.create!(album_data)
  album.album_models.create!(site_model: site_model)
end
