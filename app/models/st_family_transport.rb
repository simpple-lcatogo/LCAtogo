class StFamilyTransport < ActiveRecord::Base
  has_many :st_transports

  def name_en
    StFamilyTransportTranslation.find_by_st_family_transport_id_and_locale(id,"en").name
  end
end
