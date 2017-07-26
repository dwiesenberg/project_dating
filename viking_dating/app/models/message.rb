class Message < ApplicationRecord

  belongs to :sendable, polymorphic: true
  belongs to :receivable, polymorphic: true



end

validates :desire_to_like_you, 
                :numericality => { greater_than_or_equal_to: -1 }

validates :desire_to_like_you,
                :numericality => { less_than_or_equal_to: +1 } 
