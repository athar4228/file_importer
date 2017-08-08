class Person < ApplicationRecord

  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ #TODO move to application_record if used in multiple models

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: {  maximum: 100 }, format: EMAIL_REGEX
end
