class Note < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(pinned: :asc, updated_at: :desc) }
end
