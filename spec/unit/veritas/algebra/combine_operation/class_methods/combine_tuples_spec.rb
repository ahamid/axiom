require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::CombineOperation.combine_tuples' do
  before do
    @header = Relation::Header.new([ [ :id, Integer ], [ :name, String ] ])

    @yield = []
  end

  subject { Algebra::CombineOperation.combine_tuples(@header, [ [ 1 ] ], [ 'Dan Kubb' ]) { |tuple| @yield << tuple } }

  it 'should yield each combined tuple' do
    method(:subject).should change { @yield.dup }.from([]).to([ [ 1, 'Dan Kubb' ] ])
  end
end
