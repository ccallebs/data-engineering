require 'spec_helper'

describe Merchant do
  before {
    subject.name = 'Merchant 1'
    subject.address = '1234 Fake St.'
  }

  it { should be_valid }

  it 'requires a name' do 
    subject.name = ''
    expect(subject).to_not be_valid
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
