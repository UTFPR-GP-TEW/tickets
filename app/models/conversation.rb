class Conversation < ActiveRecord::Base
  sync :all

  #Association
  belongs_to :ticket

  #Default_Scoped
  default_scope { order('conversations.created_at DESC') }

  #Validation
  validates :content, presence: true, length: {minimum: 10}
  validates :ticket_id, presence: true

end
