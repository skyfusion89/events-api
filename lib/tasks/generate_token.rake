namespace :auth do
  desc "Generating Access Token"
  task :generate_access_token, [:access_id] => [:environment] do |t, args|
    args.with_defaults(access_id: 1)
    access_id = args[:access_id]
    app_exists = AccessToken.find_by(access_id: access_id)

    if app_exists
      puts "Your App Access ID is: #{app_exists.access_id}"
      puts "Your App Token is: #{app_exists.client_token}"
    else
      app = AccessToken.new
      app.access_id = access_id
      app.client_token = ApiAuth.generate_secret_key
      app.save
      puts "Your App Access ID is: #{app.access_id}"
      puts "Your App Token is: #{app.client_token}"
    end
  end
end
