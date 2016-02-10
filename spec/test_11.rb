require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the building's health_points by the attack_power specified" do
      @barracks.damage(4)
      expect(@barracks.health_points).to eq(496) # starts at 500
    end
  end

end

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should do deal 10 (AP) damage to the enemy unit" do
      enemy = Footman.new
      expect(enemy).to receive(:damage).with(10)
      @footman.attack!(enemy)
    end

    it "should do deal 5 (AP) damage to the barracks" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(5)
      @footman.attack!(enemy)
    end
  end

end