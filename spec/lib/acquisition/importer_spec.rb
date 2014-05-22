require 'spec_helper'

describe Acquisition::Importer do
  let(:file) { stub(path: '/') }

  subject { Acquisition::Importer.new(file) }

  before {
    first_line = "purchaser name\titem description\titem price\tpurchase count\tmerchant address\tmerchant name"
    second_line = "Snake Plissken\t$10 off $20 of food\t10.0\t2\t987 Fake St\tBob's Pizza"
    CSV.stub(:foreach).and_yield(first_line).and_yield(second_line)
  }

  context '#import!' do
    it 'processes a row' do 
      expect(subject).to receive(:process_row).twice
      subject.import!
    end
  end
end
