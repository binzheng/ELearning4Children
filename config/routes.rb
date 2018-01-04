Rails.application.routes.draw do
    
  get 'toys/showList'

  resources :toys
  resources :test_rules
  get 'result_historys/showHistList'
    
  get 'result_historys/showHistDetailList/:dateStr' => 'result_historys#showHistDetailList'

  get 'result_historys/showTestFirstHist/:result_history_id' => 'result_historys#showTestFirstHist'
    
  root to: 'users#showList'

  get 'm_test_types/showList'
  
  get 'toys/showList'
  
  get 'users/showLogin/:userId' => 'users#showLogin'

  get 'users/showList'

  get 'users/login'

  get 'result_historys/generateTest/:typeId' => 'result_historys#generateTest'

  post 'result_historys/calcTest'

  get 'result_historys/showTestHis/:result_history_id(/:point)' => 'result_historys#showTestHis'

  get 'result_historys/showTest/:result_history_id' => 'result_historys#showTest'

  resources :m_test_types
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
