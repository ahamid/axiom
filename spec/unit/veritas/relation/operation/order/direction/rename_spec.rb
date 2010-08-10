require 'spec_helper'

describe 'Veritas::Relation::Operation::Order::Direction#rename' do
  subject { direction.rename(aliases) }

  let(:attribute) { Attribute::Integer.new(:id)                      }
  let(:header)    { Relation::Header.new([ attribute ])              }
  let(:klass)     { Class.new(Relation::Operation::Order::Direction) }
  let(:direction) { klass.new(attribute)                             }

  context 'with aliases matching the attribute' do
    let(:aliases) { Algebra::Rename::Aliases.coerce(header, :id => :other_id) }

    it { should be_kind_of(klass) }

    it { should eql(klass.new(Attribute::Integer.new(:other_id))) }
  end

  context 'with aliases not matching the attribute' do
    let(:other_attribute) { Attribute::String.new(:name)                                        }
    let(:other_header)    { Relation::Header.new([ other_attribute ])                           }
    let(:aliases)         { Algebra::Rename::Aliases.coerce(other_header, :name => :other_name) }

    it { should be_kind_of(klass) }

    it { should equal(direction) }
  end
end
