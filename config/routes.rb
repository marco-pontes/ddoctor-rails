Ddoctor::Application.routes.draw do

  resources :medicacoes

  root :to => "dashboard#index"
  match 'dashboard/atendente' => 'dashboard#atendente'
  match 'dashboard/medico' => 'dashboard#medico'
  match 'dashboard/paciente' => 'dashboard#paciente'
  match 'atendimentos/inicializaModal' => 'atendimentos#inicializaModal'
  match 'consultas/inicializaModal' => 'consultas#inicializaModal'
  match 'agendas/inicializaModal' => 'agendas#inicializaModal'
  match 'atendimentos/create' => 'atendimentos#create'
  match 'medicos/autocompleteNomes' => 'medicos#autocompleteNomes'
  match 'pacientes/autocompleteNomes' => 'pacientes#autocompleteNomes'
  match 'consultas/confirmar' => 'consultas#confirmar'
  match 'consultas/cancelar' => 'consultas#cancelar'
  match 'medicos/:especialidade_id/buscaMedicosPorEspecialidade' => 'medicos#buscaMedicosPorEspecialidade'
  match 'atendimentos/buscaAtendimentosPorPaciente' => 'atendimentos#buscaAtendimentosPorPaciente'
  match "consultas/:atendimento_id/entrevista_medicas/novo" => 'entrevista_medicas#new'
  
  devise_for :usuarios, :path_prefix => 'account'

  scope :path_names => { :new => "novo", :edit => "editar", :show => "mostrar", :list => "listar" } do

    resources :medicos do
      resources :agendas
    end

    resources :tarefas do
      get 'inicializaModalDetalhes'
    end

    resources :mensagens do
      get 'inicializaModalDetalhes'
    end

    resources :usuario_perfis

    resources :perfis

    resources :consultas
    resources :entrevista_medicas
    
    resources :atendimentos do 
      get 'confirmarChegada'
    end

    resources :dashboard


    resources :atendentes

    resources :exames

    resources :especialidades

    resources :plano_saudes

    resources :enderecos

    resources :pacientes
  end
# The priority is based upon order of creation:
# first created -> highest priority.

# Sample of regular route:
#   match 'products/:id' => 'catalog#view'
# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Sample resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Sample resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Sample resource route with more complex sub-resources
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', :on => :collection
#     end
#   end

# Sample resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
# root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
