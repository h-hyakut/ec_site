Rails.application.config.generators do |g|
  g.test_framework :RSpec
  g.view_specs false
  g.routing_specs false
  g.helper_specs false
  g.fixture_replacement :factory_bot, dir: "spec/fastories"
end