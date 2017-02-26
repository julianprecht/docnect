class Appointment < ApplicationRecord
  belongs_to :doctor, :class_name => 'User'
  belongs_to :patient, :class_name => 'User'

  # Record validation
  validates :doctor,
            presence: true,
            uniqueness: { scope: :patient }
  validates :patient,
            presence: true
  # Validate correct user groups
  validate :correct_user_group

  private

  def correct_user_group
    if doctor_id && !User.find(doctor_id).group?(2)
      errors.add(:doctor, 'must have correct user group')
    elsif patient_id && !User.find(patient_id).group?(1)
      errors.add(:patient, 'must have correct user group')
    end
  end
end
