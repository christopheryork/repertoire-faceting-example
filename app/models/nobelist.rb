class Nobelist < ActiveRecord::Base
  include Repertoire::Faceting::Model
  
  # see 'repertoire-faceting/test/nobelists.sql'

  has_many :affiliations
  
  facet :discipline
  facet :nobel_year, order('nobel_year asc')
  facet :degree, joins(:affiliations).order('degree asc', 'count desc')
  facet :birth_place, group(:birth_country, :birth_state, :birth_city).order('count desc', 'birth_place asc')
  facet :birth_decade, group('((EXTRACT(year FROM birthdate)::integer / 10::integer) * 10)').order('birth_decade asc')

end