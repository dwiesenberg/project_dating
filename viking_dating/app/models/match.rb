class Match < ApplicationRecord
  
  belongs_to :matcher, class_name: "Client"
  belongs_to :matched, class_name: "Client"

  validates :matcher_id, uniqueness: {scope: :matched_id}

end

$$$$$$$$$$$$$$$$$$$$$$$$$

 has_many :sent_matches, class_name: 'Match', 
                foreign_key: :matcher_id, dependent: :destroy
 has_many :matches, through: :my_matcheds

 has_many :my_matchers,        foreign_key: :matched_id,
                               dependent: :destroy,
                               class_name: 'Match'
 has_many :matchers, through: :my_matchers


 has_many :my_recipients,      as: :messageables,
                               foreign_key: :sender_id,
                               dependent: :nullify,
                               class_name: 'Message'
 has_many :recipients, through: :my_recipients

 has_many :my_senders,         as: :messageables,
                               foreign_key: :recipient_id,
                               dependent: :nullify,
                               class_name: 'Message'
 has_many :senders,   through: :my_senders

 has_many :answers

 has_many :essential_attributes







################

class Client < ApplicationRecord

 ###### This section will still need cleaning up ######
  has_many :my_matcheds,        foreign_key: :matcher_id,
                                dependent: :destroy,
                                class_name: 'Match'
  has_many :matcheds, through: :my_matcheds

  has_many :my_matchers,        foreign_key: :matched_id,
                                dependent: :destroy,
                                class_name: 'Match'
  has_many :matchers, through: :my_matchers

###########
