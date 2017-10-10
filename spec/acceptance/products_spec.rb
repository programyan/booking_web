# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Products', acceptance: true do
  get '/api/products' do
    let(:company) { create(:company) }
    let(:category) { create(:category) }
    let!(:products) { create_list(:product, 3, company: company, category: category) }

    let(:company_id) { company.id }
    let(:category_id) { category.id }

    parameter :company_id, required: true
    parameter :category_id

    example 'Find' do
      do_request
      expect(status).to eq(200)
    end

    example 'Find (errors)' do
      do_request(company_id: nil)
      expect(status).to eq(200)
    end
  end
end
