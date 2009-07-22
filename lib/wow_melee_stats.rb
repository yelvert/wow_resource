class WowMeleeStats < WowResource
  attr_reader :main_hand_damage, :off_hand_damage, :main_hand_speed, :off_hand_speed, :power, :hit_rating, :crit_chance, :expertise
  
  def initialize(xml)
    @main_hand_damage = WowMeleeStatMainHandDamage.new(xml.at('mainHandDamage'))
    @off_hand_damage = WowMeleeStatOffHandDamage.new(xml.at('offHandDamage'))
    @main_hand_speed = WowMeleeStatMainHandSpeed.new(xml.at('mainHandSpeed'))
    @off_hand_speed = WowMeleeStatOffHandSpeed.new(xml.at('offHandSpeed'))
    @power = WowMeleeStatPower.new(xml.at('power'))
    @hit_rating = WowMeleeStatHitRating.new(xml.at('hitRating'))
    @crit_change = WowMeleeStatCritChance.new(xml.at('critChance'))
    @expertise = WowMeleeStatExpertise.new(xml.at('expertise'))
  end
end

#Below are the different classes for each of the attributes of the MeleeStats for a character

  class WowMeleeStatMainHandDamage < WowResource
    attr_reader :damage_per_second, :min_damage, :max_damage, :percent, :speed

    def initialize(xml)
      @damage_per_second = xml[:dps].to_f
      @min_damage = xml[:min].to_i
      @max_damage = xml[:max].to_i
      @percent = xml[:percent].to_f
      @speed = xml[:speed].to_f
    end
  end
  
  class WowMeleeStatOffHandDamage < WowResource
    attr_reader :damage_per_second, :min_damage, :max_damage, :percent, :speed

    def initialize(xml)
      @damage_per_second = xml[:dps].to_f
      @min_damage = xml[:min].to_i
      @max_damage = xml[:max].to_i
      @percent = xml[:percent].to_f
      @speed = xml[:speed].to_f
    end
  end
  
  class WowMeleeStatMainHandSpeed < WowResource
    attr_reader :haste_percent, :haste_rating, :value

    def initialize(xml)
      @haste_percent = xml[:hastePercent].to_f
      @haste_rating = xml[:hasteRating].to_i
      @value = xml[:value].to_f
    end
  end
  
  class WowMeleeStatOffHandSpeed < WowResource
    attr_reader :haste_percent, :haste_rating, :value

    def initialize(xml)
      @haste_percent = xml[:hastePercent].to_f
      @haste_rating = xml[:hasteRating].to_i
      @value = xml[:value].to_f
    end
  end
  
  class WowMeleeStatPower < WowResource
    attr_reader :base, :total, :added, :increased_damage_per_second

    def initialize(xml)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
      @increased_damage_per_second = xml[:increasedDps].to_f
    end
  end
  
  class WowMeleeStatHitRating < WowResource
    attr_reader :increased_hit_percentage, :armor_penetration_rating, :reduced_armor_percent, :value

    def initialize(xml)
      @increased_hit_percentage = xml[:increasedHitPercent].to_f
      @armor_penetration_rating = xml[:armorPenetrationRating].to_i
      @reduced_armor_percent = xml[:reducedArmorPercent].to_f
      @value = xml[:value].to_i
    end
  end
  
  class WowMeleeStatCritChance < WowResource
    attr_reader :percent, :added_percentage, :rating

    def initialize(xml)
      @percent = xml[:percent].to_f
      @added_percentage = xml[:plusPercent].to_f
      @rating = xml[:rating].to_i
    end
  end
  
  class WowMeleeStatExpertise < WowResource
    attr_reader :additional, :percent, :rating, :value

    def initialize(xml)
      @additional = xml[:additional].to_i
      @percent = xml[:percent].to_f
      @rating = xml[:rating].to_i
      @value = xml[:value].to_i
    end
  end