module RailsGraphql

  class  InstallGenerator < Rails::Generators::Base
    #  source_root File.expand_path('templates', __dir__)


    def install_graphql
      if behavior == :invoke
        generate "graphql:install"
        install_authentication
      else
        # TODO: Add destroy feature
        # Rails::Generators.invoke 'devise:install', :behavior => :revoke
        puts "Destroy does not support yet, you can destroy generators manually."
      end
    end


    def migrate_db
      rake 'db:migrate'
    end

    private
    def install_authentication
      puts self.behavior
      puts "Select your authentication method"
      puts "1: No Authentication"
      puts "2: Install Devise"
      puts "3: Install OTP base"

      auth_type = ''
      loop do
        auth_type = STDIN.gets.chomp
        break if [1,2,3].include? auth_type.to_i
      end

      if auth_type == '2'
        install_devise
        install_devise_user

      elsif auth_type == 3
        install_otp
      end
    end

    def show_readme
      readme 'README' if behavior == :invoke
    end

    private

    def install_devise
      gem 'devise'
      generate "devise:install"
      # config/environments/development.rb
      # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    end

    def install_devise_user
      # TODO: Ask about the name
      generate("devise", "user")
    end

  end
end
