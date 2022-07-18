module CommentsHelper
    def user_comment_email(user_id)
       
        user = User.find_by(id: user_id)
        full_name = (user.first_name + " " + user.last_name)
        
    end
end
