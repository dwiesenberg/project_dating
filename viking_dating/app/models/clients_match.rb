class ClientsMatch < ApplicationRecord
  
  belongs_to :matcher, class_name: "Client"
  belongs_to :matchee, class_name: "Client"

  validates :matcher_id, uniqueness: {scope: :matchee_id}

end
