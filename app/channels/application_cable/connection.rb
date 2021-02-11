# module ApplicationCable
#   class Connection < ActionCable::Connection::Base
#     identified_by :current_user

#     def connect
#       reject_unauthorized_connection unless find_verified_user
#     end

#     private

#     def find_verified_user
#       self.current_user = env['warden'].user
#     end
#   end
# end

module ApplicationCable
  class Connection < ::ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed['user_id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end