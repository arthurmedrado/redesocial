Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/api/v0/survivors', to: 'api/v0/base#survivors'
  
  # Parametros lidos: name, comida, agua, etc
  post '/api/v0/novo_sobrevivente', to: 'api/v0/base#criar_sobrevivente'
  
  post '/api/v0/trocar/:de/:para', to: 'api/v0/base#troca'
  # /api/v0/trocar/1/2 => de 1 para 2
  # /api/v0/trocar/2/1 => de 2 para 1
  
  # get -> Pegar uma lista (consulta)
  # post -> Criar um objecto
  # put -> Atualizar um objeto que já existe
  # delete -> Deletar
  
  get '/api/v0/relatorio', to: 'api/v0/base#relatorio'
  get '/api/v0/relatorio/contaminados', to: 'api/v0/base#relatorio_contaminados'
  
  
end
