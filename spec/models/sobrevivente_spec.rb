require 'rails_helper'

RSpec.describe Sobrevivente, type: :model do

  it "devemos cadastrar um sobrevivente com os dados corretos" do
    @sobrevivente = Sobrevivente.create(name: "Nome", genero: "G", idade: 2, lat: 1.0, lon: 1.0)
    
    expect( @sobrevivente.valid? ).to be true
    expect( @sobrevivente.persisted? ).to be true
  end
  it "não devemos cadastrar um sobrevivente com nome em branco" do
    @sobrevivente = Sobrevivente.create(name: nil, genero: "G", idade: 2, lat: 1.0, lon: 1.0)
    
    expect( @sobrevivente.valid? ).to be false
    expect( @sobrevivente.persisted? ).to be false
  end
  it "não devemos cadastrar um sobrevivente com dados invalidos" do
    @sobrevivente = Sobrevivente.create(name: nil, genero: "G", idade: 2, lat: 1.0, lon: 1.0)
    
    expect( @sobrevivente.valid? ).to be false
    expect( @sobrevivente.persisted? ).to be false
    
    @sobrevivente = Sobrevivente.create(name: "Nome", genero: nil, idade: 2, lat: 1.0, lon: 1.0)
    
    expect( @sobrevivente.valid? ).to be false
    expect( @sobrevivente.persisted? ).to be false
    
    @sobrevivente = Sobrevivente.create(name: "Nome", genero: "G", idade: -1, lat: 1.0, lon: 1.0)
    expect( @sobrevivente.valid? ).to be false
    expect( @sobrevivente.persisted? ).to be false
    
    @sobrevivente = Sobrevivente.create(name: "Nome", genero: "G", idade: 101, lat: 1.0, lon: 1.0)
    expect( @sobrevivente.valid? ).to be false
    expect( @sobrevivente.persisted? ).to be false
  end
  
  it "ao cadastrar um sobrevivente com os dados corretos a quantidade deve aumentar" do
    antes = Sobrevivente.count
    Sobrevivente.create(name: "Nome", genero: "G", idade: 10, lat: 1.0, lon: 1.0)
    depois = Sobrevivente.count
    
    expect( depois ).to eq( antes + 1 )
  end
  
  it "devemos calcular o valor do inventario corretamente" do
    @sobrevivente = Sobrevivente.create(name: "Nicos", genero: "M", idade: 20, lat: 1.0, lon: 1.0, agua: 10, comida: 2, medicamento: 1, municao: 10)
    
    expect( @sobrevivente.value ).to eq( 10 * 4 + 2 * 3 + 1 * 2 + 10 )
  end

  it "teste erro" do
    expect( true ).to eq( false )
  end
  
  it "teste pendente"
  
end
