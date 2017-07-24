class Message < ApplicationRecord

  belongs to :sendable, polymorphic: true
  belongs to :receivable, polymorphic: true

end




