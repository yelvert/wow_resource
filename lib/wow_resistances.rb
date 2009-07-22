class WowResistances < WowResource
  attr_reader :arcane, :fire, :frost, :holy, :nature, :shadow
  
  def initialize(xml)
    @arcane = WowResistance.new(xml.at('arcane'))
    @fire = WowResistance.new(xml.at('fire'))
    @frost = WowResistance.new(xml.at('frost'))
    @holy = WowResistance.new(xml.at('holy'))
    @nature = WowResistance.new(xml.at('nature'))
    @shadow = WowResistance.new(xml.at('shadow'))
  end
end