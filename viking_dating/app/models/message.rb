class Message < ApplicationRecord

  belongs_to :messageable, polymorphic: true

  # instead of:
  # belongs_to :my_senders
  # belongs_to :my_recipients

end
