require 'nokogiri'
require 'open-uri'

date_selector = ".timestamp.width_full.margin_top_ten.ui"
author_selector = ".margin_top_sm.ui_bold"
summary_selector = ".subheadline"
paragraph_selector = ".article-section"
title_category_selector = '.story-headline'
div_selector = ".story-preview a"

categories = %w[politique economie societe faits-divers international high-tech environnement sports]

categories.each do |category|
  titles = []
  urls = []
  dates = []
  authors = []
  summaries = []
  paragraphs = []
  html_file = open("http://www.leparisien.fr/#{category}/").read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(title_category_selector).each { |i| titles << i.text }
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(div_selector).each { |element| urls << 'http:' + element.attribute('href').value }
  urls.select! { |i| i.include?("//www.leparisien.fr/") }
  urls.uniq!
  urls.each do |url|
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search(date_selector).each { |i| dates << i.text }
    html_doc.search(author_selector).each { |i| authors << i.text }
    html_doc.search(summary_selector).each { |i| summaries << i.text }
    html_doc.search(paragraph_selector).each { |i| paragraphs << i.text }
  end

  titles.each_with_index do |title, index|
  article = Article.new(
    title: title,
    url: urls[index],
    date: dates[index],
    author: authors[index],
    summary: summaries[index],
    paragraph: paragraphs[index],
    read: false,
    category: category
  )
  article.save
  end
end

# html_file = open('http://www.leparisien.fr/politique/').read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search(title_category_selector).each { |i| titles << i.text }

# html_file = open('http://www.leparisien.fr/politique/').read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search(div_selector).each { |element| urls << 'http:' + element.attribute('href').value }

# urls.select! { |i| i.include?("//www.leparisien.fr/") }
# urls.uniq!

# urls.each do |url|
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   html_doc.search(date_selector).each { |i| dates << i.text }
#   html_doc.search(author_selector).each { |i| authors << i.text }
#   html_doc.search(summary_selector).each { |i| summaries << i.text }
#   html_doc.search(paragraph_selector).each { |i| paragraphs << i.text }
# end

# titles.each_with_index do |title, index|
#   article = Article.new(
#     title: title,
#     url: urls[index],
#     date: dates[index],
#     author: authors[index],
#     summary: summaries[index],
#     paragraph: paragraphs[index],
#     read: false,
#     category: 'politique'
#   )
#   article.save!
# end
