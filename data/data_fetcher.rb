require 'mechanize'

class DataFetcher
  def self.perform
    agent = Mechanize.new
    page = agent.get("https://github.com/FortAwesome/Font-Awesome/wiki/Upgrading-from-3.2.1-to-4")
    data = page.search('//ul[@class="task-list"]/li/code[position() <= 2]').map(&:text).each_slice(2).map{|item| "\"#{item[0]}\" : \"#{item[1]}\""}.join("\n")
    file = File.open("changes.json", "w")
    file.puts "{"
    page.search('//ul[@class="task-list"]/li/code[position() <= 2]').map(&:text).each_slice(2).each do |item|
      file.puts " \"#{item[0]}\" : \"#{item[1]}\"," 
    end
    file.puts "}"
    file.close
  end
end

DataFetcher.perform