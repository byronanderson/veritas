require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Algebra::Product' do
  describe 'Commutative property' do
    before do
      @left  = Relation.new([ [ :id,   Integer ] ], [ [ 1 ], [ 2 ] ])
      @right = Relation.new([ [ :name, String  ] ], [ [ 'Dan Kubb' ], [ 'Alex Kubb' ] ])
    end

    subject { @left.product(@right) }

    it 'should not matter which order the relations are multiplied in' do
      should == @right.product(@left)
    end

    it { should have_tuples_matching_predicate }
  end
end
