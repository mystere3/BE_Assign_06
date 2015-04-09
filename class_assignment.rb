class GamingPlatform
  attr_accessor :brand, :model, :max_colors, :h_pixels, :w_pixels, :processor_speed, :memory, :launch_price, :is_portable
  
  def initialize(brand, model, colors, height_pix, width_pix, proc_speed, mem, price, portable)
    @brand = brand
    @model = model
    @max_colors = colors
    @h_pixels = height_pix
    @w_pixels = width_pix
    @processor_speed = proc_speed
    @memory = mem  #in bytes
    @launch_price = price
    @is_portable = portable
  end
  
  def to_s
    return @brand << " " << @model << " Colors: " << @max_colors.to_s << " Resolution: " << @w_pixels.to_s << "x" << @h_pixels.to_s << " Processor speed: " << @processor_speed.to_s << "MHz Memory (total system and video): " << @memory.to_s << "bytes Launch price: $" << @launch_price.to_s << (@is_portable ? " Portable" : " Not portable")
  end
end

class SonyPlatform < GamingPlatform
  attr_reader :brand
  attr_accessor :psn_avail, :disk_type, :has_netflix
  
  def initialize(model, colors, height_pix, width_pix, proc_speed, mem, price, portable, psn, disk_type, netflix)
    super("Sony", model, colors, height_pix, width_pix, proc_speed, mem, price, portable)
    @psn_avail = psn
    @disk_type = disk_type
    @has_netflix = netflix
  end
  
  def to_s
    description = super.to_s
    description << (@psn_avail ? " PSN ready " : " Not PSN ready ") << disk_type << " " << (@has_netflix ? "Netflix ready" : "Not Netflix ready")
  end
end

class XboxPlatform < GamingPlatform
  attr_accessor :xbox_live_avail, :disk_type, :direct_x_version, :has_netflix
  
  def initialize(model, colors, height_pix, width_pix, proc_speed, mem, price, live_avail, disk_type, dx_vers, netflix)
    super("Microsoft", model, colors, height_pix, width_pix, proc_speed, mem, price, false)
    @xbox_live_avail = live_avail
    @disk_type = disk_type
    @direct_x_version = dx_vers
    @has_netflix = netflix
  end
  
  def to_s
    description = super.to_s
    description << (@xbox_live_avail ? " Xbox Live ready " : " Xbox Live ready ") << disk_type << " Direct X version: " << @direct_x_version << (@has_netflix ? " Netflix ready" : " Not Netflix ready")
  end
end

atari2600 = GamingPlatform.new("Atari", "2600", 128, 160, 192, 1.19, 128, 199.99, false)

puts atari2600.to_s

ps3 = SonyPlatform.new("Playstation 3", "millions (guessing)", 720, 1280, 3200, 512000000, 499.99, false, true, "Blu-ray", true)

puts ps3.to_s

xbox360 = XboxPlatform.new("Xbox 360", "millions (guessing)", 720, 1280, 3200, 512000000, 299.99, true, "DVD-DL", "9.0c", true)

puts xbox360.to_s



