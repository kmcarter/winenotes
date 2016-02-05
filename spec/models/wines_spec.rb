require 'rails_helper'

RSpec.describe 'Wine', type: :model do
    before(:all) do
        @wine1 = FactoryGirl.build(:wine)
    end
    
    it 'has a valid factory' do
        expect(@wine1).to be_valid
    end
    
    it 'should have a name field' do
        expect(@wine1.name).to eq('Rasmussen')
    end
    
    it 'should have a varietal field' do
        expect(@wine1.varietal).to eq('Chardonnay')
    end
    
    it 'should have a year field' do
        expect(@wine1.year).to eq(2014)
    end
    
    it 'should have a vinyard field' do
        expect(@wine1.vinyard).to eq('Steve Rasmussen Santa Barbara')
    end
end