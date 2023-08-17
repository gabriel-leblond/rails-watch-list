class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # has_many :movies, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  validates :name, uniqueness: true

  # validates [:list_id], uniqueness: true
end


# Quand tu supprimes une liste, tu dois supprimer tous les signets associés (mais pas les films, car ils peuvent être indiqués en référence dans d’autres listes)
