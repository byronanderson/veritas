require File.expand_path('../../../../../spec_helper', __FILE__)

describe 'Veritas::Relation::Body#difference' do
  before do
    @header = [ [ :id, Integer ] ]
    @tuple1 = [ 1 ]
    @tuple2 = [ 2 ]

    @body  = Relation::Body.new(@header, [ @tuple1 ])
    @other = Relation::Body.new(@header, [ @tuple2 ])
  end

  subject { @body.difference(@other) }

  it { should be_kind_of(Relation::Body) }

  it { subject.header.should equal(@header) }

  it { subject.to_set.should == Set[ @tuple1 ] }
end

describe 'Veritas::Relation::Body#-' do
  it 'is an alias to #difference' do
    Relation::Body.instance_method(:-).should == Relation::Body.instance_method(:difference)
  end
end