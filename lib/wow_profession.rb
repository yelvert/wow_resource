class WowProfession < WowResource
  attr_reader :name, :current_level, :max_level
  cattr_accessor :primary_professions
  
  @@primary_professions = ["Alchemy", "Blacksmithing", "Enchanting", "Engineering", "Herbalism", "Leatherworking", "Mining", "Skinning", "Tailoring", "Jewelcrafting", "Inscription"]
  
  def initialize(xml)
    @name = xml[:name]
    @current_level = xml[:value]
    @max_level = xml[:max]
  end
end