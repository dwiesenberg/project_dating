class Client < ApplicationRecord

  has_many :my_matcheds,        foreign_key: :matcher_id,
                                dependent: :destroy,
                                class_name: 'Match'
  has_many :matcheds, through: :my_matcheds

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


end


  has_many :messages, as: :messageables,
           dependent: :nullify