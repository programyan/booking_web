# frozen_string_literal: true

class AccountRepresenter < ApplicationRepresenter
  property :id
  property :name
  property :phone
  property :email
  collection :addresses
end
