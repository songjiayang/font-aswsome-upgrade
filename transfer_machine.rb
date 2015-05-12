require 'json'

class TransferMachine

  def initialize
    @changes = JSON.parse(File.read('./data/changes.json'))
  end

  def perform(old_icon)
    if old_icon.include?('icon-rotate')
      old_icon.sub('icon-rotate', 'fa-rotate')  # 'icon-rotate-*' to 'fa-rotate-*'
    else
      return @changes[old_icon] if @changes[old_icon] #eg: 'icon-large' to 'fa-lg'
      old_icon_name = old_icon.sub('icon-', '')
      new_icon_name = @changes[old_icon_name] || old_icon_name
      "fa-#{new_icon_name}"
    end
  end
end