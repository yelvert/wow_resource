class WowCharacter < WowResource
  attr_reader :last_updated, :name, :battle_group, :realm,
                :race, :race_id, :klass, :klass_id, :level,
                :faction, :faction_id, :gender, :gender_id,
                :talent_specs, :professions, :health, :second_bar,
                :resistances, :base_stats, :melee_stats, :ranged_stats,
                :spell_stats
  cattr_accessor :alliance_races, :horde_races, :all_races, :classes, :character_sheet_url
  
  @@alliance_races = ["Draenei", "Dwarf", "Gnome", "Human", "Night Elf"]
  @@horde_races = ["Blood Elf", "Orc", "Tauren", "Troll", "Undead"]
  @@all_races = (@@alliance_races + @@horde_races)
  @@classes = ["Death Knight", "Druid", "Hunter", "Mage", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior"]
  
  @@character_sheet_url = "character-sheet.xml"
  
  def initialize(xml)
    character = xml.at('character')
    @name = character[:name]
    @battle_group = character[:battleGroup]
    @realm = character[:realm]
    @level = character[:level].to_i
    @race = character[:race]
    @race_id = character[:raceId].to_i
    @wow_class = character[:class]
    @wow_class_id = character[:classId].to_i
    @faction = character[:faction]
    @faction_id = character[:factionId].to_i
    @gender = character[:gender]
    @gender_id = character[:genderId].to_i
    character_tab = xml.at('characterTab')
    @talent_specs = []
    character_tab.at('talentSpecs').search('talentSpec').each do |talent_spec|
      @talent_specs << WowTalentSpec.new(talent_spec)
    end
    @professions = []
    character_tab.at('professions').search('skill').each do |skill|
      @professions << WowProfession.new(skill)
    end
    @health = character_tab.at('characterBars').at('health')[:effective]
    @second_bar = WowSecondBar.new(character_tab.at('characterBars').at('secondBar'))
    @resistances = WowResistances.new(character_tab.at('resistances'))
    @base_stats = WowBaseStats.new(character_tab.at('baseStats'))
    @melee_stats = WowMeleeStats.new(character_tab.at('melee'))
    @ranged_stats = WowRangedStats.new(character_tab.at('ranged'))
    @spell_stats = WowSpellStats.new(character_tab.at('spell'))
    @defense_stats = WowDefenseStats.new(character_tab.at('defenses'))
  end
  
  def self.find(name,realm)
    xml = fetch_xml(@@character_sheet_url, {"r" => realm, "n" => name})
    char = WowCharacter.new(xml)
    char
  end
end