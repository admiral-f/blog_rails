require "spec_helper"

feature "Article Creation" do
  before(:each) do
    sign_up
  end
  
  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.article_new')
  end

  scenario "allows user to create new article" do
    visit new_article_path
    fill_in :article_title, :with => 'example title'
    fill_in :article_text, :with => 'example text'
    click_button 'Yarrr!'
    expect(page).to have_content I18n.t('articles.article_comments')
  end
end



 