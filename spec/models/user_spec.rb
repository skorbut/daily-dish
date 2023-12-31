# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '#email_required?' do
    it 'returns false' do
      expect(described_class.new.email_required?).to be false
    end
  end

  describe '#email_changed?' do
    it 'returns false' do
      expect(described_class.new.email_changed?).to be false
    end
  end
end
