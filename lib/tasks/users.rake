namespace :users do
  desc 'Create a user'
  task :create => :environment do
    puts "Creating new user"

    # Get email address:
    print "Email address: "
    email = STDIN.gets.strip

    # Get password:
    print "Password: "
    password = STDIN.noecho(&:gets).strip

    # Create user:
    user = User.create(email: email, password: password)
    
    # Check whether user was created:
    if user.id
      puts "\nUser created!"
    else
      puts "\nUser could not be created:"
      user.errors.each do |field, message|
        puts "   - #{field.to_s.capitalize} #{message}"
      end
    end
  end
end
