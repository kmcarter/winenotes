require 'rails_helper'

RSpec.describe Note, type: :model do
  before(:all) do
    @wine = FactoryGirl.create(:wine)
    @user = FactoryGirl.create(:user)
    #TODO: figure out how to use FactoryGirl to generate a note
    @note = @wine.notes.build(rating: 3, tasting_notes: "This wine is okay.", user_id: @user.id)
  end
  
  it 'belongs to a wine' do
    expect(@note.wine).to eq(@wine)
  end
    
  it 'belongs to a user' do
    expect(@note.user).to eq(@user)
  end
  
  it 'has a valid factory' do
    expect(@note).to be_valid
  end
  
  it { is_expected.to have_db_column(:wine_id) }
  it { is_expected.to have_db_column(:user_id) }
  it { is_expected.to have_db_column(:rating) }
  it { is_expected.to have_db_column(:tasting_notes) }
  
  it { is_expected.to belong_to(:wine) }
  it { is_expected.to belong_to(:user) }
  
  it { is_expected.to validate_presence_of(:rating) }
end