Colchonet::Application.routes.draw do

	LOCALES = /en|pt\-BR/

	scope "(:locale)", :locale => LOCALES do
	  resources :rooms
	  resources :users

	  resource :confirmation, :only => [:show]
 	end

 	match '/:locale' => 'home#index', :locale => LOCALES

 	root :to =>"home#index"

end
