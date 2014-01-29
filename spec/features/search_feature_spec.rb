require 'spec_helper'

describe 'searching' do
  
  before do
    create(:post, title: 'yolo')
    create(:post, title: 'YoLo')
    create(:post, title: 'Lolo')
  end

  it 'can should do a partial matching on title' do
    
    visit '/'
    
    fill_in 'search',with: 'yolo'
    expect(page).to have_content 'yolo'
    expect(page).to have_content 'YoLo'
    expect(page).to have_content 'Lolo'
    
  end

end