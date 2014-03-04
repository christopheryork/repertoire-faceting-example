require "cases/helper"

require "models/nobelist"

class RelationTest < FacetingTestCase
  
  passes   :unindexed
  
  def test_inherit_facet_refinements
    query    = Nobelist.refine(:degree => 'Ph.D', :discipline => 'Medicine').refine(:discipline => 'Economics')
    refines  = { :degree => [ 'Ph.D' ], :discipline => [ 'Medicine', 'Economics' ] }
    
    assert_equal refines, query.refine_value
  end
  
  def test_inherit_base_query
    query    = Nobelist.where(:name => 'Robert')
    refined  = query.refine(:degree => [ 'Ph.D' ])
    
    assert_equal query.where_values, refined.where_values
  end
  
end