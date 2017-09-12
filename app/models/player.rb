class Player < ApplicationRecord
  belongs_to :team
  validates_presence_of :first_name, :last_name, :position
  validates_inclusion_of :position, in: %w(QB RB FB WR TE T G C DE DT LB CB S)
  
  def sortable_name
    "#{last_name}, #{first_name}"
  end

  def display_name
    "#{first_name} #{last_name}"
  end
end
