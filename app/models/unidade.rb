class Unidade < ActiveRecord::Base
  belongs_to :bloco

  validates :numero, :piso, presence: true
end
