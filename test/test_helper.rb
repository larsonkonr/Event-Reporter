gem 'minitest', '~> 5.2'
require 'simplecov'; SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/cli'
require_relative '../lib/entry_repository'
require_relative '../lib/entry'
require_relative '../lib/printer'
require_relative '../lib/entry_queue'
require_relative '../lib/input'
require_relative '../lib/data_cleaner'
