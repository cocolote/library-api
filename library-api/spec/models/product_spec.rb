require 'rails_helper'

RSpec.describe Product, type: :model do
  # Association test
  it { should belong_to(:product_type) }
  it { should have_many(:checkouts).dependent(:destroy) }
  it { should have_many(:customers).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:name) }
end
