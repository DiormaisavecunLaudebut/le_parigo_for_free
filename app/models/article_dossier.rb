class ArticleDossier < ApplicationRecord
  belongs_to :article
  belongs_to :dossier
end
