require 'spec_helper'

describe Acquisition::Normalizer do
  let(:row) {
    { 
      purchaser_name: 'Purchaser name',
      purchase_count: 10,
      item_description: 'Item description',
      item_price: 'Item price',
      merchant_name: 'Merchant name',
      merchant_address: 'Merchant address'
    }
  }

  let(:purchase) { stub_model Purchase, revenue: 50.0 }

  subject { Acquisition::Normalizer.new(row) }

  context '#normalize!' do
    it 'populates purchase' do 
      expect(subject).to receive(:populate_purchase).with(row)
      subject.normalize!
    end
  end

  it 'fetches purchase revenue' do
    subject.stub(:purchase).and_return(purchase)
    expect(subject.revenue).to eq(purchase.revenue)
  end 
end
