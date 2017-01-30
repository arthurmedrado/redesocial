class Sobrevivente < ApplicationRecord
  
  validates_presence_of :name
  validates_presence_of :genero
  validates_inclusion_of :idade, in: 0..100
  
  def value
    agua * 4 + comida * 3 + medicamento * 2 + municao
  end
  
  def troca(sobrevivente, recebe, envia)
    return false if contaminado?
    
    if envia.value == recebe.value
      self.agua = recebe.agua + self.agua
      self.agua = self.agua - envia.agua
      sobrevivente.update_attributes(agua: sobrevivente.agua + envia.agua - recebe.agua)
      return true
    else
      return false
    end
  end
  
  def reportar_contaminacao
    update_attributes(contaminado: contaminado + 1)
  end
  
  def contaminado?
    contaminado >= 3
  end
  
end
