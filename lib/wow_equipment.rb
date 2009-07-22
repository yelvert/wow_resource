class WowEquipmentSlot < WowResource
  attr_reader :id, :location
  
  def initialize(attrs)
    @id = attrs[:id]
    @location = attrs[:location]
  end
end

class WowEquipment < WowResource
end