require 'rubyXL'

  def load_countries
    begin
      workbook = RubyXL::Parser.parse("doc/countries.xlsx", "false")
      data = workbook.worksheets[0].extract_data
      Country.transaction do
        Country.delete_all
        for i in 1..data.count-1
          Country.new(:name=>data[i][1], :abbr=>data[i][2]).save
          puts "#{i}.- #{data[i][1]}"
        end
      end
    rescue Exception => e
      puts e.message
    end
  end

  load_countries
