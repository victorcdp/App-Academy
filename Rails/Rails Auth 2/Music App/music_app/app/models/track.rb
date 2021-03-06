class Track < ApplicationRecord
    validates :album_id, :title, :ord, presence: true
    validates :album_id, uniqueness: { scope: :ord, message: 'two tracks can\' occupy the same spot'}

    belongs_to :album
    has_many :notes, dependent: :destroy
end