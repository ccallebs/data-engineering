require 'spec_helper'

describe Item do
  let(:merchant) { Merchant.new }

  before {
    subject.price = 5.00
    subject.stub(:merchant).and_return(merchant)
  }

  it { should be_valid }

  it 'requires a merchant' do 
    subject.stub(:merchant).and_return(nil)
    expect(subject).to_not be_valid
  end

  it 'requires a price' do 
    subject.price = nil
    expect(subject).to_not be_valid
  end
end
