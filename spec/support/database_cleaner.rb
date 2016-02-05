#could be in rails_helper.rb, but breaking out into its own file is considered best practice
RSpec.configure do |config|
    config.before(:suite) do
        DatabaseCleaner.clean_with(:truncation)
    end
    config.before(:each) do
        DatabaseCleaner.strategy = :transaction
    end
    #truncating here because when dealing with data in Javascript, you may actually
    #want the data committed to the database so you can work with it
    config.before(:each, :js => true) do
        DatabaseCleaner.strategy = :truncation
    end
    config.before(:each) do
        DatabaseCleaner.start
    end
    config.before(:each) do
        DatabaseCleaner.clean
    end
end