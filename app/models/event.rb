class Event < ApplicationRecord
  scope :past, -> { where('eventdate <=  ?', Date.today) }
  scope :upcoming, -> { where('eventdate > ?', Date.today) }
  belongs_to :creator, class_name: :User
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
  validates :description, presence: true
  validates :eventdate, presence: true
end
