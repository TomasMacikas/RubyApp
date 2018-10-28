require 'spec_helper'

RSpec.describe(Notification) do
  context 'on create' do
    let(:notification) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Admin')
    end

    it 'date set correctly' do
      expect(notification.date).to eq '2018-28-10'
    end
    it 'date format correct' do
      regex = /^\d{4}[-]\d{2}[-]\d{2}$/
      expect(!notification.date[regex].nil?).to eq true
    end
    it 'title set correctly' do
      expect(notification.title).to eq 'First'
    end
    it 'text set correctly' do
      expect(notification.text).to eq 'Hello'
    end
    it 'sender set correctly' do
      expect(notification.sender).to eq 'Admin'
    end
  end
end