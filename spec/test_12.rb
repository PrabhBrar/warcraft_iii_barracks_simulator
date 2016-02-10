require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#dead?" do
    it "returns true if unit's health points are less than equal to 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end

    it "returns false if unit's health points are more than 0" do
      expect(@unit).to receive(:health_points).and_return(1)
      expect(@unit.dead?).to be_falsy
    end
  end

end