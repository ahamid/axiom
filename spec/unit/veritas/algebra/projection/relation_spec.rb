require File.expand_path('../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Product#relation' do
  before do
    @relation = Relation.new([ [ :id, Integer ] ], [ [ 1 ] ])

    @projection = Algebra::Projection.new(@relation, [ :id ])
  end

  subject { @projection.relation }

  it { should equal(@relation) }
end
