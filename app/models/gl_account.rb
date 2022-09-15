class GlAccount < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 2, message: "name must be at least two characters." }
    validates :number, presence: true, numericality: { only_integer: true }, uniqueness: true, length: { minimum: 4, message: "number must be at least four characters." }
    validates :gl_type, presence: true, inclusion: { in: %w(expense income import), message: "gl_type must be income or expense." }
end