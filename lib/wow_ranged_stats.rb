class WowRangedStats < WowResource
  attr_reader :weapon_skill, :damage, :speed, :power, :hit_rating, :crit_chance
  
  def initialize(xml)
    @weapon_skill = WowRangedStatWeaponSkill.new(xml.at('weaponSkill'))
    @damage = WowRangedStatDamage.new(xml.at('damage'))
    @speed = WowRangedStatSpeed.new(xml.at('speed'))
    @power = WowRangedStatPower.new(xml.at('power'))
    @hit_rating = WowRangedStatHitRating.new(xml.at('hitRating'))
    @crit_chance = WowRangedStatCritChance.new(xml.at('critChance'))
  end
end

#Below are thr different classes for each of the attributes of the RangedStats for a character

  class WowRangedStatWeaponSkill < WowResource
    attr_reader :additional, :percent, :rating, :value

    def initialize(xml)
      @additional = xml[:additional].to_i
      @percent = xml[:percent].to_f
      @rating = xml[:rating].to_i
      @value = xml[:value].to_i
    end
  end
  
  class WowRangedStatDamage < WowResource
    attr_reader :damage_per_second, :min_damage, :max_damage, :percent, :speed

    def initialize(xml)
      @damage_per_second = xml[:dps].to_f
      @min_damage = xml[:min].to_i
      @max_damage = xml[:max].to_i
      @percent = xml[:percent].to_f
      @speed = xml[:speed].to_f
    end
  end
  
  class WowRangedStatSpeed < WowResource
    attr_reader :haste_percent, :haste_rating, :value

    def initialize(xml)
      @haste_percent = xml[:hastePercent].to_f
      @haste_rating = xml[:hasteRating].to_i
      @value = xml[:value].to_f
    end
  end
  
  class WowRangedStatPower < WowResource
    attr_reader :base, :total, :added, :increased_damage_per_second, :increased_pet_attack_power, :increased_pet_spell_power

    def initialize(xml)
      @base = xml[:base].to_i
      @total = xml[:effective].to_i
      @added = xml[:effective].to_i - xml[:base].to_i
      @increased_damage_per_second = xml[:increasedDps].to_f
      @increased_pet_attack_power = ((xml[:petAttack] == "-1.00") ? nil : xml[:petAttack].to_f)
      @increased_pet_spell_power = ((xml[:petSpell] == "-1.00") ? nil : xml[:petSpell].to_f)
    end
  end
  
  class WowRangedStatHitRating < WowResource
    attr_reader :increased_hit_percentage, :armor_penetration_rating, :reduced_armor_percent, :value

    def initialize(xml)
      @increased_hit_percentage = xml[:increasedHitPercent].to_f
      @armor_penetration_rating = xml[:armorPenetrationRating].to_i
      @reduced_armor_percent = xml[:reducedArmorPercent].to_f
      @value = xml[:value].to_i
    end
  end
  
  class WowRangedStatCritChance < WowResource
    attr_reader :percent, :added_percentage, :rating

    def initialize(xml)
      @percent = xml[:percent].to_f
      @added_percentage = xml[:plusPercent].to_f
      @rating = xml[:rating].to_i
    end
  end