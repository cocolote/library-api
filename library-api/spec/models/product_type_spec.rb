require 'rails_helper'

RSpec.describe ProductType, type: :model do
  # Association test
  it { should have_many(:products).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:name) }
end
