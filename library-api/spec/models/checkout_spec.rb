require 'rails_helper'

RSpec.describe Checkout, type: :model do
  # Association test
  it { should belong_to(:product) }
  it { should belong_to(:customer) }
end
