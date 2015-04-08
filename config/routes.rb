Rails.application.routes.draw do
  namespace :staff do
    root 'top#index'
  end

  namespace :admin do
    root 'top#index'
  end

  namespace :customer do
    root 'top#index'
  end

  get '*anything' => 'errors#not_found'
end
