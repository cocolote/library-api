require 'rails_helper'

RSpec.describe CustomersController, type: :request do
  # Initialize test data
  let!(:customers) { create_list(:customer, 10) }
  let(:customer_id) { customers.first.id }
  let(:products) {
    [
      build(:product, product_type_id: 1),
      build(:product, product_type_id: 2),
      build(:product, product_type_id: 3),
      build(:product, product_type_id: 4)
    ]
  }
  let(:overdue_checkouts) {
    [
      build(:checkout, customer_id: customer_id, product_id: products[0].id, pickup_date: Time.now - 31.days),
      build(:checkout, customer_id: customer_id, product_id: products[1].id, pickup_date: Time.now - 31.days),
      build(:checkout, customer_id: customer_id, product_id: products[3].id, pickup_date: Time.now - 31.days), 
    ]
  }

  # Test suite for GET /customers
  describe 'GET /customers' do
    before { get '/customers' }

    it 'returns customers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /customers/:id
  describe 'GET /customers/:id' do
    before { get "/customers/#{customer_id}" }

    context 'when the record exists' do
      it 'returns the customer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(customer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:customer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for GET /customers/:id
  describe 'GET /customers/:id/checkouts' do

    context 'when customer has overdue items' do
      before { get "/customers/#{customer_id}/checkouts", params: { overdue: true } }

      it 'returns overdue products' do
        expect(json).not_to be_empty
        expect(json['overdue_items'].size).to eq(3)
      end

      it 'returns overdue amount for a customer' do
        expect(json['amount']).not_to be_empty
      end
    end

    context 'when request customer checkout history' do
      before { get "/customers/#{customer_id}/checkouts" }

      it 'returns all checkout items' do
        expect(json).not_to be_empty
        expect(json['items'].size).to eq(3)
      end
    end
  end

  # Test suite for POST /customers
  describe 'POST /customers' do
    # valid payload
    let(:valid_attributes) { { name: 'Data', email: 'data@enterprise.com', address: 'Omicron Theta' } }

    context 'when the request is valid' do
      before { post '/customers', params: valid_attributes }

      it 'creates a customer' do
        expect(json['name']).to eq('Data')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for PUT /customers/:id
  describe 'PUT /customers/:id' do
    let(:valid_attributes) { { name: 'Will T. Riker' } }

    context 'when the record exists' do
      before { put "/customers/#{customer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
