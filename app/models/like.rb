class Like < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :photo,optional: true
end
