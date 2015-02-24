class StTransport < ActiveRecord::Base
  belongs_to :st_family_transport

  def name_en
    StTransportTranslation.find_by_st_transport_id_and_locale(id,"en").name
  end

end
