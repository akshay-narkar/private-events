class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: :Event
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances
  # validates :password, presence: { message: 'Needs to be present' },
  #                      length: { minimum: 7, message: 'Password should be atleast 7 characters long' }
  # validates :email, presence: { message: 'Needs to be present' },
  #                   uniqueness: { message: 'Already taken. Please try a new one' }, length: { minimum: 5 }
  validates :username, presence: { message: 'Needs to be present' },
                       uniqueness: { message: 'Already taken. Please try a new one' },
                       length: { minimum: 3, message: 'Username should be atleast 3 characters long' }
  # validates :name, presence: { message: 'Name cant be blank' },
  #                  uniqueness: { message: 'Already taken. Try a new one' }, length: { minimum: 5 }
end
