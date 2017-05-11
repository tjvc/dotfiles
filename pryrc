begin
  require 'hirb'
rescue LoadError => e
  warn "Failed to load hirb: #{e}"
end

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

# Enable tab completion for Rails classes
Rails.application.eager_load! if defined? Rails
