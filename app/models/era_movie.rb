class EraMovie < ApplicationRecord
  belongs_to :era
  belongs_to :movie
end
