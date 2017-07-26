class Answer < ApplicationRecord
  
  # belongs_to :question
  belongs_to :client
  belongs_to :choice
  
end
