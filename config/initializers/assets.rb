Rails.application.config.assets.precompile +=
  %w( admin.css staff.css customer.css staff.js admin.js customer.js )

Sprockets::Context.send(:include, Rails.application.routes.url_helpers)