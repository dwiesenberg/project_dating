class Client < ApplicationRecord

  has_many :sent_matches,       class_name: 'ClientsMatch', 
                                foreign_key: :matcher_id, 
                                dependent: :destroy
  has_many :matchees,           through: :sent_matches

  has_many :received_matches,   class_name: 'ClientsMatch', 
                                foreign_key: :matchee_id, 
                                dependent: :destroy
  has_many :matchers,           through: :received_matches


  has_many :sent_messages,      as: :sendable, 
                                dependent: :nullify
  has_many :recipients,         through: :sent_messages

  has_many :received_messages,  as: :receivable, 
                                dependent: :nullify
  has_many :senders,            through: :received_messages


  has_many :answers

  has_many :essential_attributes

end

