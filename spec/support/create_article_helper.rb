def create_article
    visit new_article_path
    fill_in :article_title, :with => 'example title'
    fill_in :article_text, :with => 'example text'
    click_button 'Yarrr!'
end