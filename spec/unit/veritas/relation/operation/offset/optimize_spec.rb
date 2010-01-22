require File.expand_path('../../../../../../spec_helper', __FILE__)

describe 'Veritas::Relation::Operation::Offset#optimize' do
  before do
    @relation   = Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ], [ 3 ] ])
    @directions = Relation::Operation::Order::DirectionSet.new([ @relation[:id] ])
    @order      = Relation::Operation::Order.new(@relation, @directions)
  end

  subject { @offset.optimize }

  describe 'containing an order operation' do
    before do
      @offset = Relation::Operation::Offset.new(@order, 1)
    end

    it { should equal(@offset) }
  end

  describe 'containing an offset operation' do
    before do
      @original = Relation::Operation::Offset.new(@order, 5)

      @offset = Relation::Operation::Offset.new(@original, 10)
    end

    it { should be_kind_of(Relation::Operation::Offset) }

    it 'should add the offset of the operations' do
      subject.to_i.should == 15
    end

    it 'should return the same tuples as the unoptimized operation' do
      should == @offset
    end
  end
end
