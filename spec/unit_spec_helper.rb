
Dir[File.expand_path("../unit/support/**/*.rb", __FILE__)].each do |f|
  require f
end

RSpec.configure do |config|
  config.filter_run wip: true
  config.run_all_when_everything_filtered = true
end
