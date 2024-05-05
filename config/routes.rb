Rails.application.routes.draw do
  get 'forecast', to: 'weather#forecast'
end
