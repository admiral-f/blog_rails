require "spec_helper"

feature "Comment Creation" do
  before(:each) do
    sign_up
    create_article
  end
  
  scenario "allows user to see new comment form" do
    visit '/articles/1'
    page.should have_selector(:link_or_button, 'Yarrr!')
    
  end

  scenario "allows user to create new comment" do
    visit '/articles/1'
    fill_in :comment_body, :with => 'example comment'
    click_button 'Yarrr!'
    expect(page).to have_content 'example comment'
  end
end