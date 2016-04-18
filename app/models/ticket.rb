class Ticket < ActiveRecord::Base

  enum status: {  aberto: 0 , fechado: 1, em_andamento: 2, aguardando_visto: 3, cancelado: 4}

  belongs_to :project

  validates :title, presence: true, length: {minimum: 10}
  validates :description, presence: true, length: {minimum: 10}
  validates :status, presence: true
  validates :project_id, presence: true
end
