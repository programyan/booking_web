# frozen_string_literal: true

class ProductRepresenter < ApplicationRepresenter
  property :id
  property :company_id
  property :category_id
  property :title
  property :description
  property :brief
  property :photo
  property :main_options
  property :additional_info
  property :active
end
