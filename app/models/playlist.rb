class Playlist
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, :type => Moped::BSON::ObjectId
  field :title, :type => String
  field :deezer_url, :type => String
  field :image_url, :type => String
  
  belongs_to :user, :class_name => "User", :inverse_of => :playlists, :index => true
  
  # run 'rake db:mongoid:create_indexes' to create indexes
    
end

