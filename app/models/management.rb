class Management < ApplicationRecord
  belongs_to :manager,      class_name: "User"
  belongs_to :managed_coop, class_name: "Coop"
end
