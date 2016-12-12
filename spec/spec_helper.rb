
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'luna_gem'
require 'httparty'
require 'json'
require 'dotenv'
Dotenv.load
require 'support/vcr_setup'
