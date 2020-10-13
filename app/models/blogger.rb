class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { only_integer: true, greater_than: 0}
    validates_length_of :bio, :minimum => 30


    def posts_likes
        self.posts.map {|post| post.likes}.sum
    end 

    def most_liked_post
        self.posts.sort_by { |post| post.likes}.last 
    end 

end
