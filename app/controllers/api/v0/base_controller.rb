class Api::V0::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  
  def survivors
    render json: {
      data: [
        "João",
        "Maria",
        "Etc"
      ]
    }
  end
  
  def criar_sobrevivente
    @s = Sobrevivente.create(
      name: params[:name], genero: params[:genero], idade: params[:idade],
      lat: params[:lat], lon: params[:lon],
      agua: params[:agua], comida: params[:comida], medicamento: params[:medicamento],
      municao: params[:municao]
    )
    render json: @s
  end
  
  
  # Efetua troca entre sobreviventes
  # :params:
  #   agua
  #   comida
  # 
  # :return: true
  def troca
    @remetente = Sobrevivente.where(id: params[:de]).first
    @destinatario = Sobrevivente.where(id: params[:para]).first
    
    enviar = {agua: 1, comida: 2, medicamento: 3, municao: 4}
    receber = {agua: 0, comida: 2, medicamento: 3, municao: 8}
    
    trocou = @remetente.troca(@destinatario, enviar, receber)
    
    render json: { status: trocou }
  end
  
  # O metdoo faz isso
  # rebe x, y, z, como parametros
  # retorna a
  def reportar
    @sobrevivente = Sobrevivente.where(id: params[:de]).first
    @sobrevivente.reportar_contaminacao
  end
  
  def relatorio
    @sobreviventes = Sobrevivente.all
    
    contaminados = @sobreviventes.select{|s| s.contaminado? }.count
    nao_contaminados = @sobreviventes.select{|s| !s.contaminado? }.count
    
    # @sobreviventes Lista com todos os sobreviventes
    # .select{|s| s.contaminado? } Selecionar só os que retornarem true
    # .map(&:value) tranformar cada objecto Sobrevivente no valor da função value
    # .inject(0, &:+) executa o metodo `+` entre os elementos do array, com 0 valor inicial
    
    render json: {
      contaminados: 100 * contaminados / @sobreviventes.count,
      nao_contaminados: 100 * nao_contaminados / @sobreviventes.count,
      pontos_perdidos: @sobreviventes.select{|s| s.contaminado? }.map(&:value).inject(0, &:+)
    }
  end
  
  def relatorio_contaminados
    @sobreviventes = Sobrevivente.all
    
    contaminados = @sobreviventes.select{|s| s.contaminado? }.count
    
    render json: {
      contaminados: 100 * contaminados / @sobreviventes.count
    }
  end
  
end
