# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w[
  bootstrap.css
  fontawesome-all.min.css
  fancybox.min.css
  owl.carousel.min.css
  owl.theme.default.css
  owl.theme.css
  ui.css
  responsive.css
  jquery-2.0.0.min.js
  bootstrap.bundle.min.js
  fancybox.min.js
  owl.carousel.min.js
  script.js
]
