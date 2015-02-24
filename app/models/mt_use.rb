class MtUse < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_energy_process
  
  def processing    
    tmp = read_attribute(:processing)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end
  
  def ready    
    tmp = read_attribute(:ready)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end

  def standby
    tmp = read_attribute(:standby)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end
  
  def shifts_day
    tmp = read_attribute(:shifts_day)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def shifts_day_2
    tmp = read_attribute(:shifts_day_2)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def shifts_day_3
    tmp = read_attribute(:shifts_day_3)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          
  
  def working_days
    tmp = read_attribute(:working_days)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def working_days_2
    tmp = read_attribute(:working_days_2)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def working_days_3
    tmp = read_attribute(:working_days_3)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_processing
    tmp = read_attribute(:hours_shift_processing)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_processing_2
    tmp = read_attribute(:hours_shift_processing_2)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_processing_3
    tmp = read_attribute(:hours_shift_processing_3)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_ready
    tmp = read_attribute(:hours_shift_ready)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_ready_2
    tmp = read_attribute(:hours_shift_ready_2)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_ready_3
    tmp = read_attribute(:hours_shift_ready_3)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_standby
    tmp = read_attribute(:hours_shift_standby)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_standby_2
    tmp = read_attribute(:hours_shift_standby_2)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def hours_shift_standby_3
    tmp = read_attribute(:hours_shift_standby_3)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end        
  

  def parts_produced
    tmp = read_attribute(:parts_produced)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def parts_produced_2
    tmp = read_attribute(:parts_produced_2)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end          

  def parts_produced_3
    tmp = read_attribute(:parts_produced_3)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end        
  
  
end
