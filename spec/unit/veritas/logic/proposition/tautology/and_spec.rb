require 'spec_helper'

describe Logic::Proposition::Tautology, '#and' do
  subject { object.and(other) }

  let(:other)  { mock('other')            }
  let(:object) { described_class.instance }

  it { should equal(other) }
end