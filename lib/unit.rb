class Unit

  attr_reader :health_points, :attack_power

  # Initializes health_points and attack_power for a unit object.
  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  # Inflicts damage on the enemy unit equal to the attack_power of self.
  # Returns an Integer.
  def attack!(unit)
    unless self.dead? || unit.dead?
      unit.damage(attack_power) 
    end
  end

  # Updates the health_points of self, if attacked.
  def damage(ap)
    @health_points -= ap
  end

  def dead?
    health_points <= 0
  end

end