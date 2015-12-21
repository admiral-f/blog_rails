require "spec_helper"

feature "Article edit" do
  before(:each) do
    sign_up
    create_article
  end
  
  scenario "allows user to see edit article page" do
    visit '/articles/1/edit'
    expect(page).to have_content I18n.t('articles.article_edit')
    
  end

  scenario "allows user to edit article" do
    visit '/articles/1/edit'
    fill_in :article_title, :with => 'example title 2'
    fill_in :article_text, :with => 'example text 2'
    click_button 'Yarrr!'
    expect(page).to have_content 'example title 2'
  end
end