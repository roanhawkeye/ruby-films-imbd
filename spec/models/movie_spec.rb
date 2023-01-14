# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { FactoryBot.create :movie }

  it 'is valid Movie' do
    expect(movie).to be_valid
  end
end
