require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'has many models' do
    assc = described_class.reflect_on_association(:models)
    expect(assc.macro).to eq :has_many
  end
end
