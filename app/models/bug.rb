class Bug < ApplicationRecord
  belongs_to :responsible_related, class_name: 'User', foreign_key: :responsible_related_id
  belongs_to :reponsible_solution, class_name: 'User', foreign_key: :reponsible_solution_id
  belongs_to :quality_assurance, class_name: 'User', foreign_key: :quality_assurance_responsible_id
  belongs_to :project
  has_many :comments, as: :commentable, dependent: :destroy

  enum status: %i[created in_progress refused finished paused]
  enum quality_assurance_status: %i[started in_progress reviewed refused reviewed_commented]
  enum responsible_sector: %i[quality_assurance dev_front dev_back design product_manager]
  enum priority: %i[low mid high]
end
