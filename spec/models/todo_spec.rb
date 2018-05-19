require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should have_many(:items).dependent(:destroy) }
  it { should validate_prescense_of(:title) }
  it { should validate_prescense_of(:created_by) }
end
