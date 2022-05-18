class Event < ApplicationRecord
  has_one :property, :class_name => 'EventProperty', dependent: :delete
  validates :event_id, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :property

  def as_json(options = {})
    super(options.merge(include: :property))
  end
end
