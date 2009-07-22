class WowItem < WowResource
  attr_reader :id, :icon_name, :level, :name, :quality, :type, :tooltip
  
  @@base_item_url = "item-info.xml"
  @@rarities = [
    {:name => "Poor", :color => "Grey"},
    {:name => "Common", :color => "White"},
    {:name => "Uncommon", :color => "Green"},
    {:name => "Rare", :color => "Blue"},
    {:name => "Epic", :color => "Purple"},
    {:name => "Legendary", :color => "Orange"},
    {:name => "Heirloom", :color => "Tan"}
  ]
  @@item_types = {
    :one_handed_axes => "weapon",
    :two_handed_axes => "weapon",
    :bows => "weapon",
    :guns => "weapon",
    :one_handed_maces => "weapon",
    :two_handed_maces => "weapon",
    :polearms => "weapon",
    :one_handed_swords => "weapon",
    :two_handed_swords => "weapon",
    :staves => "weapon",
    :fist_weapons => "weapon",
    :miscellaneous => "weapon",
    :daggers => "weapon",
    :thrown => "weapon",
    :crossbows => "weapon",
    :wands => "weapon",
    :fishing_pole => "weapon",
    
  }
  
  cattr_accessor :base_item_url, :rarities
  
  def initialize(id)
    xml = WowResource.fetch_xml(@@base_item_url, {:i => id})
    item = xml.at('item')
    @id = item[:id].to_i
    @icon_name = item[:icon_name]
    @level = item[:level].to_i
    @name = item[:name]
    @quality = item[:quality].to_i
    @type = item[:type]
  end
end

class WowArmorItem < WowItem
  
end
  
    Armor
    
      
        Cloth
      
      
        Leather
      
      
        Mail
      
      
        Plate
      
      
        Shield
      
      
        Idol
      
      
        Libram
      
      
        Totem
      
      
        Sigil
      
      
        Miscellaneous
      
    
  
  
    Gems
    
      
        Blue
      
      
        Red
      
      
        Yellow
      
      
        Meta
      
      
        Green
      
      
        Orange
      
      
        Purple
      
      
        Prismatic
      
    
  
  
    Glyphs
    
      
        Death Knight
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Druid
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Hunter
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Mage
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Paladin
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Priest
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Rogue
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Shaman
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Warlock
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
      
        Warrior
        
          
            Major Glyphs
          
          
            Minor Glyphs
          
        
      
    
  
  
    Containers
    
      
        Bag
      
      
        Soul Bag
      
      
        Herb Bag
      
      
        Enchanting Bag
      
      
        Engineering Bag
      
      
        Gem Bag
      
      
        Mining Bag
      
    
  
  
    Consumables
  
  
    Trade Goods
    
      
        Recipes
      
      
        Reagents
      
      
        Enchantments
      
    
  
  
    Projectiles
    
      
        Arrow
      
      
        Bullet
      
    
  
  
    Quivers
    
      
        Quiver
      
      
        Ammo Pouch
      
    
  
  
    Miscellaneous
    
      
        Keys
      
    
  
  
    Companions
    
      
        Mounts
      
      
        Small Pets
      
    
  

