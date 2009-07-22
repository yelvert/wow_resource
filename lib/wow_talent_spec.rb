class WowTalentSpec < WowResource
  attr_reader :primary, :group, :icon, :tree_one, :tree_two, :tree_three, :active
  
  def initialize(xml)
    @primary = xml[:prim]
    @group = xml[:group].to_i
    @icon =  xml[:icon]
    @tree_one = xml[:treeOne].to_i
    @tree_two = xml[:treeTwo].to_i
    @tree_three = xml[:treeThree].to_i
    @active = ((xml[:active].to_i == 1) ? true : false)
  end
end