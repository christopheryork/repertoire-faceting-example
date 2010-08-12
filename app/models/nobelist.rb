class Nobelist < ActiveRecord::Base
  include Repertoire::Faceting::Model
  
  # see 'repertoire-faceting/test/nobelists.sql'

  has_many :affiliations
  
  facet :discipline
  facet :nobel_year
  facet :degree, joins(:affiliations)
  facet :birth_place, group(:birth_country, :birth_state, :birth_city)
  facet :birthdate, group('EXTRACT (year FROM birthdate)', 'EXTRACT (month FROM birthdate)', 'EXTRACT (day FROM birthdate)')

end