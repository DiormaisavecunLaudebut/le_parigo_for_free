class ArticlesController < ApplicationController

  def politique
    @articles = Article.where('category = ?', 'politique')
  end

  def societe
    @articles = Article.where('category = ?', 'societe')
  end

  def economie
    @articles = Article.where('category = ?', 'economie')
  end

  def faits_divers
    @articles = Article.where('category = ?', 'faits-divers')
  end

  def international
    @articles = Article.where('category = ?', 'international')
  end

  def environnement
    @articles = Article.where('category = ?', 'environnement')
  end

  def sports
    @articles = Article.where('category = ?', 'sports')
  end
end
