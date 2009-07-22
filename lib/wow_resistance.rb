class WowResistance < WowResource
  attr_reader :name, :value, :pet_bonus
  
  def initialize(xml)
    @name = xml.name
    @value = xml[:value].to_i
    @pet_bonus = ((xml[:petBonus].to_i == -1) ? nil : xml[:petBonus].to_i)
  end
end