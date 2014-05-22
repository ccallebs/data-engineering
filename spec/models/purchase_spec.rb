require 'spec_helper'

describe Purchase do
  let(:item) { stub_model Item, id: 1, price: 5.0 }
  before { 
    subject.stub(:item).and_return(item)
    subject.count = 5
  }

  it { should be_valid }

  it 'retrieves item price' do
    expect(subject.price).to eq(item.price)
  end

  it 'calculates revenue' do
    expected_revenue = subject.count * item.price
    expect(subject.revenue).to eq(expected_revenue)
  end

  it 'requires an item' do
    subject.stub(:item).and_return(nil)
    expect(subject).to_not be_valid
  end

  it 'requires a count' do
    subject.count = nil
    expect(subject).to_not be_valid
  end
end
