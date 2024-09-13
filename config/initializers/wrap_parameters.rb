# config/initializers/wrap_parameters.rb
ActiveSupport.on_load(:action_controller) do
  # Disable parameter wrapping for all formats
  wrap_parameters format: []
end