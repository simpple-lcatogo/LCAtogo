class AddNewStExcelValues < ActiveRecord::Migration
  def self.up
    indicator_st = Indicator.find_by_sector("textiles")
    
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyester yarn with carbon (Anti-Static)', :functional_unit => 'kg', :local_name => 'Polyester yarn with carbon (Anti-Static)', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 0.874)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Bamboo Yarn with Silver', :functional_unit => 'kg', :local_name => 'Bamboo Yarn with Silver', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 68.9)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Cotton yarn blended with Stainless steel', :functional_unit => 'kg', :local_name => 'Cotton yarn blended with Stainless steel', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 5.27)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyamide Nylon Yarn with Stainless steel thread', :functional_unit => 'kg', :local_name => 'Polyamide Nylon Yarn with Stainless steel thread', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 3.54)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyester yarn blended with Stainless steel', :functional_unit => 'kg', :local_name => 'Polyester yarn blended with Stainless steel', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 2.95)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Stainless Steel Fiber Sewing Thread', :functional_unit => 'kg', :local_name => 'Stainless Steel Fiber Sewing Thread', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 4.64)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Cotton/polyester blended yarn with Stainless steel', :functional_unit => 'kg', :local_name => 'Cotton/polyester blended yarn with Stainless steel', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive yarns", :value => 4.02)               
    
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Nylon Mesh Copper & Nickel coated 20g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Nylon Mesh Copper & Nickel coated 20g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 4.48)    
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyester Fabric Copper & tin coated', :functional_unit => 'kg', :local_name => 'Polyester Fabric Copper & tin coated', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 9.31)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'polyester taffeta Copper coated 80g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'polyester taffeta Copper coated 80g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 4.67)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Nylon Copper, Nickel coated 90g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Nylon Copper, Nickel coated 90g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 9.26)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyester Copper, Nickel coated 90g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Polyester Copper, Nickel coated 90g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 8.48)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Nylon netting Silver coated 35g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Nylon netting Silver coated 35g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 31.1)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Spandex Silver coated 110g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Spandex Silver coated 110g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 36.9)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Bamboo Fabric with Silver thread (30%) 190g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Bamboo Fabric with Silver thread (30%) 190g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 69.2)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Cotton fabric with Silver thread (5%)', :functional_unit => 'kg', :local_name => 'Cotton fabric with Silver thread (5%)', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 12.8)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyester/Cotton fabric with Silver thread (5%)', :functional_unit => 'kg', :local_name => 'Polyester/Cotton fabric with Silver thread (5%)', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 12.4)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Nylon fabric with Silver thread (55%) 100g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Nylon fabric with Silver thread (55%) 100g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 113)    
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Polyester fabric with Silver thread (55%) 100g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Polyester fabric with Silver thread (55%) 100g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 113)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Knitted jersey fabric with Silver thread 100/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Knitted jersey fabric with Silver thread 100/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 71.3)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Cotton curtain fabric with Stainless steel thread (20%) 70g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Cotton curtain fabric with Stainless steel thread (20%) 70g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 4.84)
    StExcelValue.create(:indicator_id => indicator_st.id, :flow_name => 'Cotton fabric with Stainless steel thread (30%) 180g/m<sup>2</sup>', :functional_unit => 'kg', :local_name => 'Cotton fabric with Stainless steel thread (30%) 180g/m<sup>2</sup>', :life_cycle_phase => "Raw Materials &amp; Components", :category => "Materials", :family => "Conductive fabric", :value => 5.25)
    
  end



  def self.down
  end
end