Rails.application.routes.draw do
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'politique', to: 'articles#politique'
  get 'societe', to: 'articles#societe'
  get 'economie', to: 'articles#economie'
  get 'faits_divers', to: 'articles#faits_divers'
  get 'international', to: 'articles#international'
  get 'high_tech', to: 'articles#high_tech'
  get 'environnement', to: 'articles#environnement'
  get 'sports', to: 'articles#sports'
end
