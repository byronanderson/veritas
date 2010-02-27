require File.expand_path('../../../../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe 'Veritas::Algebra::Restriction::Expression#rename' do
  before do
    @expression = ExpressionSpecs::Object.new
  end

  subject { @expression.rename({}) }

  it 'should return self' do
    should equal(@expression)
  end
end
