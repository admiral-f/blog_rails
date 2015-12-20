require "spec_helper"

describe Article do
  describe "validation" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end
  describe "associations" do 
    it { should have_many :comments }
  end

  describe "#subject" do
    it "retutns the article title" do
      article = create(:article, title: 'Lorem Ipsum')
      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end

  describe "#last_comment" do
    it "returns the last comment" do
      article=create(:article_with_comments)
      expect(article.last_comment.body).to eq 'comment body 3'
    end
  end

  describe "max_length" do
    it { should validate_length_of(:title).is_at_most(400) }
    it { should validate_length_of(:text).is_at_most(4000) }
  end

end