class VikingCoordinator < ApplicationRecord

    has_many :messages, as: :messageables,
           dependent: :nullify
end
