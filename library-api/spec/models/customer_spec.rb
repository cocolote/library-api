require 'rails_helper'

RSpec.describe Customer, type: :model do
  # Association test
  it { should have_many(:checkouts).dependent(:destroy) }
  it { should have_many(:products).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
