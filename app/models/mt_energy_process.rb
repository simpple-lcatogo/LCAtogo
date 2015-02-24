class MtEnergyProcess < ActiveRecord::Base
  belongs_to :mt_energy_family

  def name_changed
    name.gsub!(/_/, ': ')
  end
end
