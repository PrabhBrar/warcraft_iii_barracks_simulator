class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  # Inflicts damage on the enemy siege engine unit equal to the attack_power of self.
  # If the enemy is a building(Barracks) inflicts damage equal to double of the attack_power.
  # If any other enemy unit, does not inflict any damage.
  # Returns an Integer.
  def attack!(unit)
    if unit.instance_of?(Barracks)
      unit.damage((attack_power * 2))
    elsif unit.instance_of?(SiegeEngine)
      super(unit)
    end
  end

end