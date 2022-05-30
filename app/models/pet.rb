class Pet < ApplicationRecord
  belongs_to :client
  has_many :histories, dependent: :destroy
  accepts_nested_attributes_for :histories

  def history_count
    @pet = Pet.find(id)
    @pet.histories.count

  end

  def avg_weight
    @pet = Pet.find(id)
    @pet.histories.average(:wheight)
  end

  def avg_height
    @pet = Pet.find(id)
    @pet.histories.average(:height)
  end

  def max_weight
    @pet = Pet.find(id)
    @pet.histories.maximum(:wheight)
  end

  def max_height
    @pet = Pet.find(id)
    @pet.histories.maximum(:height)
  end

end
