class WowSecondBar < WowResource
  attr_reader :type, :amount
  cattr_accessor :second_bar_types
  
  @@second_bar_types = {"p" => "Runic Power", "m" => "Mana", "e" => "Energy", "r" => "Rage"}
  
  def initialize(xml)
    @type = @@second_bar_types[xml[:type]]
    @amount = xml[:effective]
  end
end