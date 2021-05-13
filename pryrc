if defined? Rails
  # Enable tab completion for Rails classes
  Rails.application.eager_load!

  # Load Rails console helpers
  # http://api.rubyonrails.org/classes/Rails/ConsoleMethods.html
  require 'rails/console/app'
  extend Rails::ConsoleMethods
end

if defined? PryByebug
  Pry.commands.alias_command 'cc', 'continue'
  Pry.commands.alias_command 'ss', 'step'
  Pry.commands.alias_command 'nn', 'next'
  Pry.commands.alias_command 'ff', 'finish'
end

Pry.commands.alias_command 'ww', 'whereami'

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
