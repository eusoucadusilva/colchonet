Colchonet::Application.routes.draw do

	LOCALES = /en|pt\-BR/

	scope "(:locale)", :locale => LOCALES do
	  resources :rooms do
	  	resources :reviews, :only => [:create, :update], :module => :room
	  end


	  resources :users

	  resource :confirmation, :only => [:show]
	  resource :user_sessions, :only =>[:create, :new , :destroy]

 	end

 	match '/:locale' => 'home#index', :locale => LOCALES

 	root :to =>"home#index"

end
