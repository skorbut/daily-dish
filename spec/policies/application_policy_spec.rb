# frozen_string_literal: true

require 'rails_helper'

describe ApplicationPolicy do
  it 'provides the defaults' do
    policy = described_class.new(nil, nil)
    expect(policy).to respond_to(:index?)
    expect(policy).to respond_to(:show?)
    expect(policy).to respond_to(:create?)
    expect(policy).to respond_to(:new?)
    expect(policy).to respond_to(:update?)
    expect(policy).to respond_to(:edit?)
    expect(policy).to respond_to(:destroy?)
  end

  it 'authorizes by default' do
    policy = described_class.new(nil, nil)
    expect(policy.index?).to be false
    expect(policy.show?).to be false
    expect(policy.create?).to be false
    expect(policy.new?).to be false
    expect(policy.update?).to be false
    expect(policy.edit?).to be false
    expect(policy.destroy?).to be false
  end

  it 'defines a default scope' do
    scope = described_class::Scope.new(nil, nil)
    expect(scope).to be_present
  end

  describe 'default scope#resolve' do
    it 'raise a not implemented error' do
      scope = described_class::Scope.new(nil, nil)
      expect { scope.resolve }.to raise_error(NotImplementedError)
    end
  end
end
