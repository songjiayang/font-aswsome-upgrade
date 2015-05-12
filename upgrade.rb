require './transfer_machine'

class Upgrade
  def initialize(folder)
    @folder = folder
    @icon_transfer = TransferMachine.new
  end

  def perform
    all_files.each do |file|
      extname = File.extname(file)
      original_text = File.read(file)
      transform_text = original_text.gsub(/icon-[\w|\-]+/){|m| get_replace(m, extname)} rescue next # skip binary files
      io = File.open(file, 'w')
      io.write transform_text
      io.close
    end
  end

  private

  def all_files
    if File.directory?(@folder)
      Dir.glob(@folder+"/**/*").select {|f| !File.directory? f}
    else
      [@folder]
    end
  end

  def get_replace(old_icon, extname)
    new_icon = @icon_transfer.perform(old_icon)
    if ['.css', '.scss', '.sass'].include?(extname)
      new_icon
    elsif ['.slim', '.haml', '.skim'].include?(extname)
      "fa.#{new_icon}"
    else
      "fa #{new_icon}"
    end
  end
end

folder = ARGV[0] || '.'
Upgrade.new(folder).perform
