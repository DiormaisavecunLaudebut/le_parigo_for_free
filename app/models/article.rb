class Article < ApplicationRecord
  has_many :dossiers, through: :article_dossiers
  has_many :article_dossiers

  validates :title, :author, :date, :summary, :paragraph, :url, presence: true
  validates :title, :url, uniqueness: true
end
