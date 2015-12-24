class Content < ActiveRecord::Base
  has_one :note

  def to_s
    return text_content.to_s if content_type == 'text'
    raise "Content type not implemented"
  end
end
