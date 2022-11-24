class Project < ApplicationRecord
  belongs_to :user
  has_many :bugs

  validates :name, presence: true, allow_blank: false 
end
