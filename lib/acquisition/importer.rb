require 'csv'

module Acquisition
  class Importer
    def initialize(file)
      @csv = file
      @revenue = 0
    end

    def import!
      csv_options = { headers: true, header_converters: :symbol, col_sep: "\t" }
      CSV.foreach(@csv.path, csv_options) do |row|
        process_row(row)
      end
    end

    def total_revenue
      @revenue.to_s
    end

    private

    def process_row(row)
      data = Acquisition::Normalizer.new(row)
      data.normalize!
      @revenue += data.revenue
    end
  end
end
