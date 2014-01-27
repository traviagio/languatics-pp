require 'spec_helper'

describe 'upvoting and downvoting' do

	before do
		create(:post)
	end


	specify 'upvoting a post increases vote count' do
		visit '/posts'
		click_button 'Upvote'
		expect(page).to have_css '.votes_count', text: '1'
	end


end