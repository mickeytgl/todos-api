require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:todo) }
  it { shoul validate_prescense_of(:name) }
end
