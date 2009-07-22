class WowDefenseStats < WowResource
  attr_reader :armor, :defense, :dodge, :parry, :block, :resilience
  
  def initialize(xml)
    @armor = WowDefenseStatArmor.new(xml.at('armor'))
    @defense = WowDefenseStatDefense.new(xml.at('defense'))
    @dodge = WowDefenseStatDodge.new(xml.at('dodge'))
    @parry = WowDefenseStatParry.new(xml.at('parry'))
    @block = WowDefenseStatBlock.new(xml.at('block'))
    @resilience = WowDefenseStatResilience.new(xml.at('resilience'))
  end
end

#Below are the different classes for each of the attributes of the DefenseStats for a character

  class WowDefenseStatArmor < WowResource
    attr_reader :base, :added, :total, :physical_damage_reduce_percentage, :pet_bonus

    def initialize(xml)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = (xml[:effective].to_i - xml[:base].to_i)
      @physical_damage_reduce_percentage = xml[:percent].to_f
      @pet_bonus = ((xml[:petBonus] == "-1") ? nil : xml[:petBonus].to_f)
    end
  end
  
  class WowDefenseStatDefense < WowResource
    attr_reader :decrease_hit_percentage, :increase_hit_percentage, :defense_rating, :base, :total, :added

    def initialize(xml)
      @decrease_hit_percentage = xml[:decreasePercent].to_f
      @increase_hit_percentage = xml[:increasePercent].to_f
      @added = xml[:plusDefense].to_i
      @rating = xml[:rating].to_i
      @base = xml[:value].to_f
      @total = (xml[:value].to_f + xml[:plusDefense].to_f)
    end
  end
  
  class WowDefenseStatDodge < WowResource
    attr_reader :base, :added, :total, :dodge_rating

    def initialize(xml)
      @base = xml[:percent].to_f
      @added = xml[:increasePercent].to_f
      @total = (xml[:percent].to_f + xml[:increasePercent].to_f)
      @dodge_rating = xml[:rating].to_i
    end
  end
  
  class WowDefenseStatParry < WowResource
    attr_reader :base, :added, :total, :parry_rating

    def initialize(xml)
      @base = xml[:percent].to_f
      @added = xml[:increasePercent].to_f
      @total = (xml[:percent].to_f + xml[:increasePercent].to_f)
      @parry_rating = xml[:rating].to_i
    end
  end
  
  class WowDefenseStatBlock < WowResource
    attr_reader :base, :added, :total, :block_rating

    def initialize(xml)
      @base = xml[:percent].to_f
      @added = xml[:increasePercent].to_f
      @total = (xml[:percent].to_f + xml[:increasePercent].to_f)
      @block_rating = xml[:rating].to_i
    end
  end
  
  class WowDefenseStatResilience < WowResource
    attr_reader :reduced_damage_percentage, :reduced_hit_percentage, :value

    def initialize(xml)
      @reduced_damage_percentage = xml[:damagePercent].to_f
      @reduced_hit_percentage = xml[:hitPercent].to_f
      @value = xml[:value].to_f
    end
  end