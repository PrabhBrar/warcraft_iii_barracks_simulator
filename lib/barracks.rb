require 'footman'

class Barracks

  attr_reader :gold, :food, :lumber, :health_points

  # Initialize gold = 1000 and food = 80.
  def initialize
    @gold = 1000
    @lumber = 500
    @food = 80
    @health_points = 500
  end

  # Checks if Barracks can train a new Footman.
  # Always returns a Boolean.
  def can_train_footman?
    gold >= 135 && food >= 2
  end

  # Trains a new Footman from the Barracks and updates the gold and food left in the Barracks.
  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  # Checks if Barracks can train a new Peasant.
  # Always returns a Boolean.
  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  # Trains a new Peasant from the Barracks and updates the gold and food left in the Barracks.
  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  # Checks if Barracks can train a new Footman.
  # Always returns a Boolean.
  def can_train_siege_engine?
    gold >= 200 && food >= 3 && lumber >= 60
  end

  # Trains a new Footman from the Barracks and updates the gold and food left in the Barracks.
  def train_siege_engine
    if can_train_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    end
  end

  # Updates the health_points of self, if attacked.
  def damage(ap)
    @health_points -= ap
  end

end
