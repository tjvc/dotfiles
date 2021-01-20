begin require 'hirb'; rescue LoadError; end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  # (see https://github.com/pry/pry/wiki/faq#hirb)
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

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
