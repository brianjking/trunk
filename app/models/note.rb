class Note < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  belongs_to :content

  default_scope -> { order(pinned: :desc, updated_at: :desc) }

  def to_filename
    formatted_date = I18n.l(created_at, format: :computer)
    "#{formatted_date}-#{title.parameterize}-#{id}.md"
  end

  def exported_content
    "# #{title}\r\n#{content}"
  end
end
