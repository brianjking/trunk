class Note < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(pinned: :desc, updated_at: :desc) }
end
