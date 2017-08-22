require 'rails_helper'

RSpec.describe Model, type: :model do
  it 'belongs to organization' do
    assc = described_class.reflect_on_association(:organization)
    expect(assc.macro).to eq :belongs_to
  end

  it 'has many model types' do
    assc = described_class.reflect_on_association(:model_types)
    expect(assc.macro).to eq :has_many
  end
end
