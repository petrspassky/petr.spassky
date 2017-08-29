FactoryGirl.define do
  factory :album do
    site
    artist
    title 'Walking in Sunshine'
    cover_url 'http://n4.femjoy.com/updates/15724532_bpf413_cok775/cover2_384x384.jpg'
    url 'https://hosted.femjoy.com/galleries/15724532_bpf413_cok775?affid=2588917'
    photos 24
    date '2017-08-29'
    image_template 'femjoy_15724532_%.3d.jpg'
  end
end
