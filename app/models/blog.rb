class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  #cette partie implémentée pour l'association type many-to-many
  has_many :favorites, dependent: :destroy

  #validations
  validates :title, presence: true
  validates :image, presence: true
end
