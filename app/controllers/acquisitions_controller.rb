require './lib/acquisition/importer'
require './lib/acquisition/normalizer'

class AcquisitionsController < ApplicationController
  def create
    importer = Acquisition::Importer.new params[:data]
    importer.import!
    @total_revenue = importer.total_revenue
  end
end
