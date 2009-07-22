class WowGlyph < WowResource
  cattr_accessor :glyphs_url, :glyphs_params, :glyph_url, :tooltip_url
  
  @@glyphs_url = "search.xml"
  @@glyphs_params = {"searchType" => "items", "fl[source]" => "all", "fl[type]" => "glyphs", "searchQuery" => ""}
  
  @@glyph_url = "item-info.xml"
  @@tooltip_url = "item-tooltip.xml"
  
  @@glyph_storage_path = File.join(WowResource::storage_path, "glyphs.yaml")
  
  def self.all(update = false)
    items = {:major_glyphs => [], :minor_glyphs => []}
    if update
      xml = fetch_xml(@@glyphs_url, @@glyphs_params)
      xml.at('items').search('item').each do |item|
        item = find(item[:id])
        puts item.name
        if item.kind_of? WowMajorGlyph
          items[:major_glyphs] << item
        else
          items[:minor_glyphs] << item
        end
      end
    else
      items = YAML.load_file(@@glyph_storage_path)
    end
    items
  end
  
  def self.find(id)
    info = fetch_xml(@@glyph_url, {:i => id.to_s})    
    more_info = fetch_xml(@@tooltip_url, {:i => id.to_s})
    ((more_info.at('glyphType').innerText.downcase == "major") ? WowMajorGlyph.new([info, more_info]) : WowMinorGlyph.new([info, more_info]))
  end
  
  def self.update
    items = all(true)
    file = File.new(@@glyph_storage_path, File::CREAT|File::TRUNC|File::RDWR)
    file.puts items.to_yaml
    file.close
    puts "Done Updating"
  end
  
end

class WowMajorGlyph < WowResource
  attr_accessor :id, :name, :effect, :klass, :min_lvle
  
  def initialize(xml = nil, params = nil)
    if xml.blank?
      @id = params[:id]
      @min_lvl = params[:min_lvl]
      @name = params[:name]
      @wow_class = params[:class]
      @effect = params[:effect]
    else
      item = xml[0].at('item')
      @id = item[:id].to_i
      @min_lvl = item[:level].to_i
      @name = item[:name]
      @wow_class = item[:type]
      @effect = xml[1].at('desc').innerText
    end
  end
end

class WowMinorGlyph < WowResource
  attr_accessor :id, :name, :effect, :klass, :min_lvl
  
  def initialize(xml = nil, params = nil)
    if xml.blank?
      @id = params[:id]
      @min_lvl = params[:min_lvl]
      @name = params[:name]
      @wow_class = params[:class]
      @effect = params[:effect]
    else
      item = xml[0].at('item')
      @id = item[:id].to_i
      @min_lvl = item[:level].to_i
      @name = item[:name]
      @wow_class = item[:type]
      @effect = xml[1].at('desc').innerText
    end
  end
end