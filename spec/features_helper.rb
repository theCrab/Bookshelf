# Require this file for feature tests
require_relative './spec_helper'
require "support/auth_helper"

require 'capybara'
require 'capybara/dsl'

Capybara.app = Hanami::Container.new

class MiniTest::Spec
  include Capybara::DSL
  include AuthHelper
end
