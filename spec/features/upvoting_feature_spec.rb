require 'spec_helper'

describe 'upvoting and downvoting' do

	before do
		user = create(:user)
		create(:post)
		login(user)
	end


	specify 'upvoting a post increases vote count' do
		visit '/posts'
		click_button 'Upvote'
		expect(page).to have_css '.votes_count', text: '1'
	end


end