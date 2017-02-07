Rails.application.routes.draw do
  resources :chapters do  # sets up the 7 restful routs - create delete etc
    resources :sections
  end

  # resources :sections do  # sets up the 7 restful routs - create delete etc
  #   resources :lessons
  # end
end
