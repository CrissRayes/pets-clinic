class Client < ApplicationRecord
  has_many :pets, dependent: :destroy
  accepts_nested_attributes_for :pets

  def pets_count
    @client = Client.find(id)
    @client.pets.count
  end
end
