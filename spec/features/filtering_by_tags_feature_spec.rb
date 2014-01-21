require 'spec_helper'

describe 'filtering tags' do
  
  before do
  	tag = create(:tag, text: 'yolo')
   
    tagged = create(:post, title: "Something")
    create(:post, title: "Another")

    tagged.tags << tag

  end

  it 'can filter by clicking on a tag' do
    visit '/posts'
    click_link '#yolo'

    expect(page).to have_content 'Something'
    expect(page).to_not have_content 'Another'
    

  end

end