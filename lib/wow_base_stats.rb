class WowBaseStats < WowResource
  attr_reader :strength, :agility, :stamina, :intellect, :spirit, :armor
  
  def initialize(xml)
    @strength = WowBaseStatStrength.new(xml.at('strength'))
    @agility = WowBaseStatAgility.new(xml.at('agility'))
    @stamina = WowBaseStatStamina.new(xml.at('stamina'))
    @intellect = WowBaseStatIntellect.new(xml.at('intellect'))
    @spirit = WowBaseStatSpirit.new(xml.at('spirit'))
    @armor = WowBaseStatArmor.new(xml.at('armor'))
  end
end

#Below are the different classes for each of the attributes of the BaseStats for a character

  class WowBaseStatStrength < WowResource
    attr_reader :attack_power, :base, :block, :total, :added
  
    def initialize(xml)
      @attack_power = ((xml[:attack] == "-1") ? nil : xml[:attack].to_i)
      @base = xml[:base].to_i
      @block = ((xml[:block] == "-1") ? nil : xml[:block].to_i)
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
    end
  end

  class WowBaseStatAgility < WowResource
    attr_reader :armor, :attack_power, :base, :crit_hit_percentage, :total, :added
  
    def initialize(xml)
      @armor = ((xml[:armor] == "-1") ? nil : xml[:armor].to_i)
      @attack_power = ((xml[:attack] == "-1") ? nil : xml[:attack].to_i)
      @base = xml[:base].to_i
      @crit_hit_percentage = ((xml[:critHitPercent] == "-1.00") ? nil : xml[:critHitPercent].to_f)
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
    end
  end

  class WowBaseStatStamina < WowResource
    attr_reader :base, :total, :health, :pet_bonus, :added
  
    def initialize(xml)
      @health = ((xml[:health] == "-1") ? nil : xml[:health].to_i)
      @pet_bonus = ((xml[:petBonus] == "-1") ? nil : xml[:petBonus].to_i)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
    end
  end

  class WowBaseStatIntellect < WowResource
    attr_reader :base, :total, :crit_hit_percentage, :mana, :pet_bonus, :added
  
    def initialize(xml)
      @crit_hit_percentage = ((xml[:critHitPercent] == "-1.00") ? nil : xml[:critHitPercent].to_f)
      @pet_bonus = ((xml[:petBonus] == "-1") ? nil : xml[:petBonus].to_i)
      @mana = ((xml[:mana] == "-1") ? nil : xml[:mana].to_i)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
    end
  end

  class WowBaseStatSpirit < WowResource
    attr_reader :base, :total, :health_regen, :mana_regen, :added
  
    def initialize(xml)
      @health_regen = ((xml[:healthRegen] == "-1") ? nil : xml[:healthRegen].to_i)
      @mana_regen = ((xml[:manaRegen] == "-1") ? nil : xml[:manaRegen].to_i)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
    end
  end

  class WowBaseStatArmor < WowResource
    attr_reader :base, :total, :physical_damage_reduce_percentage, :pet_bonus, :added
  
    def initialize(xml)
      @physical_damage_reduce_percentage = ((xml[:physical_damage_reduce_percentage] == "-1.00") ? nil : xml[:physical_damage_reduce_percentage].to_f)
      @pet_bonus = ((xml[:petBonus] == "-1") ? nil : xml[:petBonus].to_i)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
    end
  end