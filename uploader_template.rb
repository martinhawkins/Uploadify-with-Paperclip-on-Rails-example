generate :nifty_layout
generate :nifty_scaffold, "user", "name:string"
generate :nifty_scaffold, "upload", "user_id:integer"

gem 'paperclip'
gem 'mime-types', :lib => 'mime/types'
rake "gems:install", :sudo => true

generate :paperclip, "upload", "photo"

