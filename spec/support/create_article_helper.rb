def create_article
    visit new_article_path
    fill_in :article_title, :with => 'example title',  :match => :first
    fill_in :article_text, :with => 'example text',  :match => :first
    click_button 'Yarrr!', :match => :first
end