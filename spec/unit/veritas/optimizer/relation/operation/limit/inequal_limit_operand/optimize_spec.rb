require 'spec_helper'

describe 'Veritas::Optimizer::Relation::Operation::Limit::InequalLimitOperand#optimize' do
  subject { object.optimize }

  let(:klass)  { Optimizer::Relation::Operation::Limit::InequalLimitOperand }
  let(:order)  { Relation.new([ [ :id, Integer ] ], [ [ 1 ] ].each).order   }
  let(:limit)  { order.limit(2)                                             }
  let(:object) { klass.new(relation)                                        }

  before do
    object.operation.should be_kind_of(Relation::Operation::Limit)
    object.operand.should be_kind_of(Relation::Operation::Limit)
  end

  context 'when the operand has a larger limit than the operation' do
    let(:relation) { limit.limit(1) }

    it { should eql(order.limit(1)) }
  end

  context 'when the operand has a smaller limit than the operation' do
    let(:relation) { limit.limit(3) }

    it { should eql(order.limit(2)) }
  end
end