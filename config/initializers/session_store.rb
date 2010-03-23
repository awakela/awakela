# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_awakela_session',
  :secret      => 'e524718c0cd4d301b5133ca36c1a6cf4a1bb6be7d802136378741561e9c6dfe67b9e21f0930db25141013e62d06340c7753df90ce9da86a06b6a22e0756e84dd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
