# -*- encoding : utf-8 -*-
if defined?(Footnotes) && Rails.env.development?
  Footnotes.run! # first of all

  # ... other init code
  Footnotes::Filter.notes = [:session, :cookies, :params, :filters, :routes, :env, :queries, :log, :general]

end
