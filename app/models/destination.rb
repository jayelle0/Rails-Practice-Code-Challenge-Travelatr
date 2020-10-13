class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_five_posts
        if self.posts.count > 5 
            self.posts.last(5)
        elsif self.posts.count < 5 && self.posts.count > 0
            self.posts
        else 
            "no posts"
        end 
    end 

    def most_liked_post
        self.posts.sort_by { |post| post.likes}.last 
    end 

    def blogger_avg_age 
        self.bloggers.uniq.map {|blogger|blogger.age}.sum/self.bloggers.uniq.count
    end 
    
end
