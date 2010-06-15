# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_uploader_session',
  :secret      => 'c498248f565526776998f91680200629fe735dd3d2a00a955ded640045e8690affdd8ff82269e632219494587ec64a3b4934bcc03df5b7ea20c5188f792c1a38'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
ActionController::Dispatcher.middleware.insert_before(ActionController::Session::CookieStore, FlashSessionCookieMiddleware, ActionController::Base.session_options[:key])
