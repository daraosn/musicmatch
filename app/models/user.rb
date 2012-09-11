class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :image, :type => String
  field :active, :type => Boolean
  attr_accessible :name, :email
  
  # has_many :playlists, :class_name => "Playlists", :foreign_key => "user_id", :inverse_of => :user
  
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end
  
end

