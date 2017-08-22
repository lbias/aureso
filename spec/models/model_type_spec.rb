require 'rails_helper'

RSpec.describe ModelType, type: :model do
  it 'belongs to model' do
    assc = described_class.reflect_on_association(:model)
    expect(assc.macro).to eq :belongs_to
  end
end
