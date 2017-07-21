class Match < ApplicationRecord
  
  belongs_to :matcher, class_name: "Client"
  belongs_to :matched, class_name: "Client"

  validates :matcher_id, uniqueness: {scope: :matched_id}

end
