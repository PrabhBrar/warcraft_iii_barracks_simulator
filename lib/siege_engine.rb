class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(unit)
    if unit.instance_of?(Barracks)
      unit.damage((attack_power * 2))
    elsif unit.instance_of?(SiegeEngine)
      super(unit)
    end
  end

end