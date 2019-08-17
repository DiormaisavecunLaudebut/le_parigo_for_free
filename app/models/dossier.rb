class Dossier < ApplicationRecord
  has_many :articles, through: :article_dossiers

  validates :name, presence: true
end
