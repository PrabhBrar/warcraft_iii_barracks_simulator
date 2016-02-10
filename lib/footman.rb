# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    super(60, 10)
  end
  
  # Inflicts damage on the enemy unit equal to the attack_power of self.
  # If the enemy is a building(Barracks) inflicts damage equal to half of the attack_power.
  # Returns an Integer.
  def attack!(unit)
    if unit.instance_of?(Barracks)
      unit.damage((attack_power / 2).ceil)
    else
      super(unit)
    end
  end

end
