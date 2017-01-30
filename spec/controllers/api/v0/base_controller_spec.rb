require 'rails_helper'

RSpec.describe Api::V0::BaseController, type: :controller do
  
  # describe "Pegar lista de sobreviventes" do
  #
  #   # it "Deveria pegar a lista de sobreviventes" do
  #   #   2.times do
  #   #     Survivor.create()
  #   #   end
  #   #
  #   #   get :survivors
  #   #
  #   #   json = JSON.parse(response.body)
  #   #
  #   #   expect( response ).to be_success
  #   #
  #   #   expect( json['data'] ).not_to eq(nil)
  #   #   expect( json['data'].count ).to eq(2)
  #   # end
  #
  # end

  describe "criação de sobrevivente" do
    
    it "devemos salvar os dados corretamente" do
      post :criar_sobrevivente, params: { name: "Nicos", genero: "M", idade: 20, lat: 1.0, lon: 1.0 }
      
      expect(Sobrevivente.last.name).to eq("Nicos")
      expect(Sobrevivente.last.genero).to eq("M")
      expect(Sobrevivente.last.idade).to eq(20)
      expect(Sobrevivente.last.lat).to eq(1.0)
      expect(Sobrevivente.last.lon).to eq(1.0)
    end
    
    it "devemos salvar o inventario" do
      post :criar_sobrevivente, params: {
        name: "Nicos", genero: "M", idade: 20, lat: 1.0, lon: 1.0,
        agua: 10, comida: 2, medicamento: 1, municao: 10
      }
      
      expect(Sobrevivente.last.agua).to eq( 10 )
      expect(Sobrevivente.last.comida).to eq( 2 )
      expect(Sobrevivente.last.medicamento).to eq( 1 )
      expect(Sobrevivente.last.municao).to eq( 10 )
    end
    
  end

end
