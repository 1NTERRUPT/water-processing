Rails.application.routes.draw do
  get 'home/monitor'

  get 'home/operate'

  get 'home/administrate'

  root to: 'home#monitor'
end
