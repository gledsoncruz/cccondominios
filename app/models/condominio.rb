class Condominio < ActiveRecord::Base

  has_many :blocos, :dependent => :destroy
  #accepts_nested_attributes_for :blocos, reject_if: :all_blank, allow_destroy: true

  validates :nome, :cnpj, presence: true
end
