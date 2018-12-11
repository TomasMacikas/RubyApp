# frozen_string_literal: true

require_relative 'application_record'
# Class For teachers info
class Teacher < ApplicationRecord
  validates_length_of :university,
                      maximum: 60, message: 'university max length 40 chars'
  validates_uniqueness_of :user_id,
                          message: 'user id should be unique'
  has_one :schedules
  has_many :subjects
  has_many :mails
  has_many :notifications
  has_many :students, through: :subjects
  belongs_to :user

  def self.add(university, user)
    teacher = create(university: university)
    user.teacher = teacher
  end

  def self.del(user)
    teacher = find_by(user_id: user)
    destroy(teacher.id)
  end

  def full_name
    "#{user.name} #{user.last_name}"
  end

  def email
    user.email
  end
end
