class VikingCoordinator < ApplicationRecord

  has_many :sent_messages,      as: :sendable, 
                                dependent: :nullify
  has_many :received_messages,  as: :receivable, 
                                dependent: :nullify
  
end


