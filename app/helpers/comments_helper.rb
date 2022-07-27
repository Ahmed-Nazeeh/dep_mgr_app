module CommentsHelper
    def user_comment_email(user_id)
        user = User.find_by(id: user_id)
        full_name = (user.first_name + " " + user.last_name)
    end

    def like_dislike_method(user_likes, comment_likes)
        @my_like = nil
        comment_likes.each do |c_like|
            user_likes.each do |u_like|
                if u_like == c_like
                    @my_like = c_like
                end
            end
        end
        #byebug
    end
end
