# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
logger = Logger.new(STDOUT)

publics = [
  { title: 'Типичный стерлитамаковец', outer_id: 33775112 },
  { title: 'SterlitamakCity', outer_id: 39857072 },
  { title: 'Sterlitamak.ru', outer_id: 10074715 },
  { title: 'SterliGrad', outer_id: 24168224 },
  { title: 'Cityopen', outer_id: 446821 },
  { title: 'SOS-Sterlitamak', outer_id: 65717946 }
]

feed_sources = [
  { title: 'SterlitamakCity', url: 'http://sterlitamakcity.ru/news.feed?type=atom', active: true,
    source_url: 'http://sterlitamakcity.ru/' },
  { title: 'Sterlitamak.ru', url: 'http://sterlitamak.ru/newscity/rss/', active: true,
    source_url: 'http://sterlitamak.ru/' },
  { title: 'SterliGrad', url: 'http://sterlegrad.ru/str/rss.xml', active: true,
    source_url: 'http://sterlegrad.ru/' },
  { title: 'Стерлитамакский Рабочий', url: 'http://srgazeta.ru/feed/atom/', active: true,
    source_url: 'http://srgazeta.ru/' },
  { title: 'Cityopen', url: 'http://cityopen.ru/?feed=rss2&type=atom', active: true,
    source_url: 'http://cityopen.ru/' },
  { title: 'SOS-Sterlitamak', url: 'http://www.sos-str.ru/rss_news.php', active: true,
    source_url: 'http://www.sos-str.ru/' }
]

logger.info 'Seeds publics'
publics.each do |element|
  Public.find_or_create_by(element)
end

logger.info 'Seeds feed sources'
feed_sources.each do |element|
  FeedSource.find_or_create_by(element)
end
