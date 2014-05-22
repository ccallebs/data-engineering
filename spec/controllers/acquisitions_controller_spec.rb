require 'spec_helper'

describe AcquisitionsController do

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

end
