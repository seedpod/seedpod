# RailsAdmin config file. Generated on April 01, 2013 20:10
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  config.main_app_name = ['Seedpod', 'Admin']

  config.current_user_method { current_admin }
  
  # Display empty fields in show views:
  config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Admin', 'Crop', 'Instruction', 'Pod', 'Shipment', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Admin', 'Crop', 'Instruction', 'Pod', 'Shipment', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]

end
