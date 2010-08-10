require 'spec_helper'
require File.expand_path('../fixtures/classes', __FILE__)

describe 'Veritas::Logic::Expression#rename' do
  subject { expression.rename(Algebra::Rename::Aliases.new({})) }

  let(:header)     { Veritas::TABLE_DUM.header   }
  let(:expression) { ExpressionSpecs::Object.new }

  it 'returns self' do
    should equal(expression)
  end
end
