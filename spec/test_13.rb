require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
    @enemy = Unit.new(100,5)
  end

  describe "#attack!" do
    it "returns does not attack if the unit is dead" do
      expect(@unit).to receive(:dead?).and_return(true)
      expect(@unit.attack!(@enemy)).to be_nil
    end

    it "returns does not attack if the enemy unit is dead" do
      expect(@enemy).to receive(:dead?).and_return(true)
      expect(@unit.attack!(@enemy)).to be_nil
    end
  end

end