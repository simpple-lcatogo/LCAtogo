namespace :gettext do
  def files_to_translate
   # Dir.glob("{app,lib,config,locale}/**/*.{rb,erb,haml,slim,rhtml}")
   # Dir.glob("{app,lib,config,locale,views}/[ph_]*/*.{rb,erb,haml,slim,rhtml}")
    files = []
    Dir.glob("{app,lib,config,locale}/**/*.{rb,erb,haml,slim,rhtml}").each do |f|
      if f.match("mt_")
      #  if !f.match("bp_") && !f.match("mt_") && !f.match("se_") && !f.match("st_") && !f.match("ph_") && !f.match("pc_")
         files << f
        end
    end
    return files
  end
end