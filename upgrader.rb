require 'json'

class Upgrader

  def initialize(folder)
    @dicts = JSON.parse(File.read('./dicts.json'))
    @files = Dir.glob(folder+"/**/*").select {|f| !File.directory? f}
  end

  def perform
    @files.each do |file|
      text = File.read(file).gsub(/icon-[\w|\-]+/){ |m| "#{get_replace_icon(m)}" }
      file = File.open(file, 'w')
      file.write text
      file.close
    end
  end

  private

  def get_replace_icon(text)
    new_icon = @dicts[text]
    return new_icon if new_icon
    icon_name = text.sub('icon-', "")
    new_name = @dicts[icon_name] || icon_name
    "fa fa-#{new_name}"
  end

end

folder = ARGV[0] || '.'
upgrader = Upgrader.new(folder)
upgrader.perform
