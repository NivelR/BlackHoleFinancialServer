class Tag < ApplicationRecord
  has_many :transactions

  def as_json(options={})
    {
      id: self.id,
      tag_name: self.tag_name
    }
  end
end
