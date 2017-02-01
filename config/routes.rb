Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get -> Pegar uma lista (Ler)
  # post -> Criar um objecto (Cria)
  # put -> Atualizar um objeto que já existe (Atualiza)
  # delete -> Deletar (Deleta)
  get '/api/v0/survivors', to: 'api/v0/base#survivors'

  # Parametros lidos: name, genero, idade, lat, lon, comida, agua, munição, medicamento
  post '/api/v0/novo_sobrevivente', to: 'api/v0/base#criar_sobrevivente'

  # /api/v0/trocar/1/2 => de 1 para 2
  # /api/v0/trocar/2/1 => de 2 para 1
  post '/api/v0/trocar/:de/:para', to: 'api/v0/base#troca'

  # Relatorio geral com os dados de contaminados, não contaminados e pontos perdidos
  get '/api/v0/relatorio', to: 'api/v0/base#relatorio'
  # Relatorio de contaminados
  get '/api/v0/relatorio/contaminados', to: 'api/v0/base#relatorio_contaminados'
  # Relatorio de não contaminados
  get '/api/v0/relatorio/naocontaminados', to: 'api/v0/base#relatorio_nao_contaminados'
  # Relatorio de pontos perdidos devido às infecções
  get '/api/v0/relatorio/pontosperdidos', to: 'api/v0/base#pontos_perdidos'



end
