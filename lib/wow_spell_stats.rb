class WowSpellStats < WowResource
  attr_reader :bonus_damage, :bonus_healing, :hit_rating, :crit_chance, :penetration, :mana_regen, :hase_rating
  
  def initialize(xml)
    @bonus_damase = WowSpellStatBonusDamage.new(xml.at('bonusDamage'))
    @bonus_healing = xml.at('bonusHealing')[:value].to_i
    @hit_rating = WowSpellStatHitRating.new(xml.at('hitRating'))
    @crit_chance = WowSpellStatCritChance.new(xml.at('critChance'))
    @penetration = xml.at('penetration')[:value].to_i
    @mana_regen = WowSpellStatManaRegen.new(xml.at('manaRegen'))
    @haste_rating = WowSpellStatHasteRating.new(xml.at('hasteRating'))
  end
end

#Below are the different classes for each of the attributes of the SpellStats for a character

  class WowSpellStatBonusDamage < WowResource
    attr_reader :arcane, :fire, :frost, :holy, :nature, :shadow, :pet_bonus

    def initialize(xml)
      @arcane = xml.at('arcane')[:value].to_i
      @fire = xml.at('fire')[:value].to_i
      @frost = xml.at('frost')[:value].to_i
      @holy = xml.at('holy')[:value].to_i
      @nature = xml.at('nature')[:value].to_i
      @shadow = xml.at('shadow')[:value].to_i
      @pet_bonus = WowSpellStatBonusDamagePetBonus.new(xml.at('petBonus'))
    end
  end
  
  #This is the PetBonus attribute for the BonusDamage attribute in SpellStats
    class WowSpellStatBonusDamagePetBonus < WowResource
      attr_reader :attack, :damage, :from_type

      def initialize(xml)
        @attack = ((xml[:attack] == "-1") ? nil : xml[:attack].to_i)
        @damage = ((xml[:damage] == "-1") ? nil : xml[:damage].to_i)
        @from_type = xml[:from_type]
      end
    end
  
  class WowSpellStatHitRating < WowResource
    attr_reader :increased_hit_percentage, :penetration, :reduced_enemy_resist, :value

    def initialize(xml)
      @increased_hit_percentage =  xml[:increasedHitPercentage].to_f
      @penetration = xml[:penetration].to_i
      @reduced_enemy_resist = xml[:reducedResist].to_i
      @value = xml[:value].to_i
    end
  end
  
  class WowSpellStatCritChance < WowResource
    attr_reader :arcane, :fire, :frost, :holy, :nature, :shadow, :pet_bonus

    def initialize(xml)
      @arcane = xml.at('arcane')[:percent].to_f
      @fire = xml.at('fire')[:percent].to_f
      @frost = xml.at('frost')[:percent].to_f
      @holy = xml.at('holy')[:percent].to_f
      @nature = xml.at('nature')[:percent].to_f
      @shadow = xml.at('shadow')[:percent].to_f
    end
  end
  
  class WowSpellStatManaRegen < WowResource
    attr_reader :casting, :not_casting

    def initialize(xml)
      @casting = xml[:casting].to_f
      @not_casting = xml[:notCasting].to_f
    end
  end
  
  class WowSpellStatHasteRating < WowResource
    attr_reader :haste_percent, :haste_rating

    def initialize(xml)
      @haste_percent = xml[:hastePercent].to_f
      @haste_rating = xml[:hasteRating].to_i
    end
  end