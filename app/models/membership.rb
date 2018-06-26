class Membership < ApplicationRecord
  belongs_to :member,      class_name: "User"
  belongs_to :joined_coop, class_name: "Coop"
end
