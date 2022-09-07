class Mission < ApplicationRecord
    belongs_to :planet 
    belongs_to :scientist
    validates :name, :scientist, :planet, presence: true
    validates :scientist, uniqueness: {scope: :name}
end
