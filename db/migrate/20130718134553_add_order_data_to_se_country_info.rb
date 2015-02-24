class AddOrderDataToSeCountryInfo < ActiveRecord::Migration
  def self.up
    austria =  SeCountryInfo.find_by_name("Austria")
    if !austria.nil? && austria.order.nil?
      austria.order = 1
      austria.save
    end

    belgium = SeCountryInfo.find_by_name("Belgium")
    if !belgium.nil? && belgium.order.nil?
      belgium.order = 2
      belgium.save
    end

    bulgaria = SeCountryInfo.find_by_name("Bulgaria")
    if !bulgaria.nil? && bulgaria.order.nil?
      bulgaria.order = 3
      bulgaria.save
    end

    cyprus = SeCountryInfo.find_by_name("Cyprus")
    if !cyprus.nil? && cyprus.order.nil?
      cyprus.order = 4
      cyprus.save
    end

    czech_republic = SeCountryInfo.find_by_name("Czech Republic")
    if !czech_republic.nil? && czech_republic.order.nil?
      czech_republic.order = 5
      czech_republic.save
    end

    denmark = SeCountryInfo.find_by_name("Denmark")
    if !denmark.nil? && denmark.order.nil?
      denmark.order = 6
      denmark.save
    end

    estonia = SeCountryInfo.find_by_name("Estonia")
    if !estonia.nil? && estonia.order.nil?
      estonia.order = 7
      estonia.save
    end

    finland = SeCountryInfo.find_by_name("Finland")
    if !finland.nil? && finland.order.nil?
      finland.order = 8
      finland.save
    end

    france = SeCountryInfo.find_by_name("France")
    if !france.nil? && france.order.nil?
      france.order = 9
      france.save
    end

    germany = SeCountryInfo.find_by_name("Germany")
    if !germany.nil? && germany.order.nil?
      germany.order = 10
      germany.save
    end

    greece = SeCountryInfo.find_by_name("Greece")
    if !greece.nil? && greece.order.nil?
      greece.order = 11
      greece.save
    end

    hungary = SeCountryInfo.find_by_name("Hungary")
    if !hungary.nil? && hungary.order.nil?
      hungary.order = 12
      hungary.save
    end

    ireland = SeCountryInfo.find_by_name("Ireland")
    if !ireland.nil? && ireland.order.nil?
      ireland.order = 13
      ireland.save
    end

    italy = SeCountryInfo.find_by_name("Italy")
    if !italy.nil? && italy.order.nil?
      italy.order = 14
      italy.save
    end

    latvia = SeCountryInfo.find_by_name("Latvia")
    if !latvia.nil? && latvia.order.nil?
      latvia.order = 15
      latvia.save
    end

    lithuania = SeCountryInfo.find_by_name("Lithuania")
    if !lithuania.nil? && lithuania.order.nil?
      lithuania.order = 16
      lithuania.save
    end

    luxenbourg = SeCountryInfo.find_by_name("Luxembourg")
    if !luxenbourg.nil? && luxenbourg.order.nil?
      luxenbourg.order = 17
      luxenbourg.save
    end

    malta = SeCountryInfo.find_by_name("Malta")
    if !malta.nil? && malta.order.nil?
      malta.order = 18
      malta.save
    end

    netherlands = SeCountryInfo.find_by_name("Netherlands")
    if !netherlands.nil? && netherlands.order.nil?
      netherlands.order = 19
      netherlands.save
    end

    poland = SeCountryInfo.find_by_name("Poland")
    if !poland.nil? && poland.order.nil?
      poland.order = 20
      poland.save
    end

    portugal = SeCountryInfo.find_by_name("Portugal")
    if !portugal.nil? && portugal.order.nil?
      portugal.order = 21
      portugal.save
    end

    romania = SeCountryInfo.find_by_name("Romania")
    if !romania.nil? && romania.order.nil?
      romania.order = 22
      romania.save
    end

    slovak_republic = SeCountryInfo.find_by_name("Slovak Republic")
    if !slovak_republic.nil? && slovak_republic.order.nil?
      slovak_republic.order = 23
      slovak_republic.save
    end

    slovenia = SeCountryInfo.find_by_name("Slovenia")
    if !slovenia.nil? && slovenia.order.nil?
      slovenia.order = 24
      slovenia.save
    end

    spain = SeCountryInfo.find_by_name("Spain")
    if !spain.nil? && spain.order.nil?
      spain.order = 25
      spain.save
    end

    sweden = SeCountryInfo.find_by_name("Sweden")
    if !sweden.nil? && sweden.order.nil?
      sweden.order = 26
      sweden.save
    end

    switzerland = SeCountryInfo.find_by_name("Switzerland")
    if !switzerland.nil? && switzerland.order.nil?
      switzerland.order = 27
      switzerland.save
    end

    turkey = SeCountryInfo.find_by_name("Turkey")
    if !turkey.nil? && turkey.order.nil?
      turkey.order = 28
      turkey.save
    end

    europe = SeCountryInfo.find_by_name("Europe")
    if europe.nil?
      SeCountryInfo.create(:name => 'Europe', :electricity => 0.36327,:order => '29')
    end
  end

  def self.down
  end
end
