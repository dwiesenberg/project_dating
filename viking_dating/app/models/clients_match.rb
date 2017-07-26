class ClientsMatch < ApplicationRecord
  
  belongs_to :matcher, class_name: "Client", optional: true
  belongs_to :matchee, class_name: "Client", optional: true

  validates :matcher_id, uniqueness: {scope: :matchee_id}

  validates :thumb, :numericality => { greater_than_or_equal_to: -1 }, :numericality => { less_than_or_equal_to: +2 } 

end

