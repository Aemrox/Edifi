class Message < ActiveRecord::Base
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"
    has_many :responses, class_name: "Message", foreign_key: "parent_message_id"
    belongs_to :parent_message, class_name: "Message"
end


