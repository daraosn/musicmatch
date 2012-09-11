class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :provider, :type => String
  field :facebook_id, :type => String
  field :name, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :image, :type => String
  field :banned, :type => Boolean, :default => false
  attr_accessible :name, :email
  
  has_many :playlists, :class_name => "Playlist", :foreign_key => "user_id", :inverse_of => :user
  
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.facebook_id = auth['facebook_id']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.first_name = auth['info']['first_name'] || ""
         user.last_name = auth['info']['last_name'] || ""
         user.email = auth['info']['email'] || ""
         user.image = auth['info']['image'] || ""
      end
    end
  end
  
end

