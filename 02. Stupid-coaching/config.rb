APP_ROOT = File.dirname(__FILE__)

configure do
  # Set Sinatra views folder
  set :views, Proc.new { File.join(APP_ROOT, "app", "views") }
end

# Load controllers and models
Dir[File.join(APP_ROOT, 'app', 'controllers', '*.rb')].each { |file| require file }
Dir[File.join(APP_ROOT, 'app', 'models', '*.rb')].each { |file| require file }