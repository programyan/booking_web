# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :schedules, class_name: 'CompanySchedule'
  has_many :users
  has_many :products
  has_many :devices
  has_many :tidings

  def addresses
    Address.where(id: address_ids)
  end
end
