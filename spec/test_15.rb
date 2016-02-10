require 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe "#attack!" do
    it "should do deal 50 (AP) damage to the Siege Engine unit" do
      enemy = SiegeEngine.new
      expect(enemy).to receive(:damage).with(50)
      @siege_engine.attack!(enemy)
    end

    it "should do deal 100 (AP) damage to the barracks" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(100)
      @siege_engine.attack!(enemy)
    end

    it "should do deal 0 (AP) damage to the Peasant unit" do
      enemy = Peasant.new
      expect(@siege_engine.attack!(enemy)).to be_nil
    end

    it "should do deal 0 (AP) damage to the Footman unit" do
      enemy = Footman.new
      expect(@siege_engine.attack!(enemy)).to be_nil
    end
  end

end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siege_engine" do

    it "costs 200 gold" do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "produces a footman unit" do
      siege_engine = @barracks.train_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end

  end

  describe "#can_train_siege_engine?" do
    it "returns true if there are enough resources to train a footman" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold, lumber and food to train multiple siege engine
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 2 food item left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 199 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 59 lumber left, even though it starts with 500
      # This is done by overwriting the `lumber` getter method
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end
  end

end