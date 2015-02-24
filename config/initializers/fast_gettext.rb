# configure default msgmerge parameters (the default contains "--no-location" option
# which removes code lines from the final POT file)
#Rails.application.config.gettext_i18n_rails.msgmerge = ["--sort-output", "--no-wrap", "
# --add-location"]


#Rails.application.config.gettext_i18n_rails.msgmerge = %w[--no-location]
#Rails.application.config.gettext_i18n_rails.xgettext = %w[--no-location]
#Rails.application.config.gettext_i18n_rails.default_options = %w[--no-location]

#FastGettext.add_text_domain 'lca_to_go', :path => 'locale', :type => :po
#FastGettext.default_available_locales = ['en', 'es'] #all you want to allow
#FastGettext.default_text_domain = 'lca_to_go'
#FastGettext.default_locale = 'en'
