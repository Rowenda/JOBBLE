class Offer < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :matches, dependent: :destroy
  has_many :offer_skills, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, length: { maximum: 35 }
  validates :description, presence: true, length: { in: 20..1200 }
  validates :location, presence: true
  validates :salary, presence: true
  validates :company_name, presence: true
  validates :photo, presence: true
end
