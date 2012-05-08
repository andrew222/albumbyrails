# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MyAlbum::Application.initialize!
$uploadFolder="#{Rails.root}/app/assets/images/upload"
