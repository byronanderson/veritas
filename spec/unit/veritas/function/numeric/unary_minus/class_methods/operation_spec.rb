# encoding: utf-8

require 'spec_helper'

describe Function::Numeric::UnaryMinus, '.operation' do
  subject { object.operation }

  let(:object) { described_class }

  it { should equal(:-@) }
end
