RSpec.configure do |config|
  # Include FactoryBot methods
  config.before(:each, type: :controller) do
    @request.headers['Content-Type'] = 'application/json'
  end
end
