class User < ActiveRecord::Base
    has_many :songs
    has_secure_password
    validates_presence_of :username, :password
    
    def slug
        username.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
    
end