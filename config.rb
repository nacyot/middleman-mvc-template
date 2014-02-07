require './config/middleman_routes.rb'
require './config/routes.rb'
require './config/boot.rb'
require './lib/render.rb'

# Set Routings
Routes.set_managers proxy_manager, ignore_manager
Routes.proxy_routes

page "/*", :layout => "layout"
# page "/articles/*", :layout => "blog"
# page "/feed.xml", layout: false
# page "pages/*", :layout => :articles_layout
# page "tags/*", :layout => :articles_layout
# page "/sitemap.xml", :layout => false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

after_configuration do
  sprockets.append_path File.join(File.expand_path(File.dirname(__FILE__)), 'assets', 'components')
  # sprockets.append_path File.join 'app', 'assets', 'javascripts'
end

helpers MarkdownHelper

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
set :haml, { ugly: true }

activate :directory_indexes
set :relative_links, true

# Build-specific configuration
configure :build do
  activate :relative_assets
  
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
