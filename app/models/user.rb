class User < ApplicationRecord
  # Remove whitespace
  auto_strip_attributes :email, :name, :specialization, :phone, :address, :bio, :occupation, :hobbies, :allergies, :smoke, :alcohol, :tattoos, :history, :medication, :illness, :nationality, :languages, :squish => true

  # Downcase email address before saving the user
  before_save :downcase_email

  # Global user record validation
  VALID_EMAIL_REGEX = /\A([\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+)?\z/i
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false }
  # User groups: 0=super user, 1=patient, 2=doctor
  validates :user_group,
            presence: true,
            inclusion: 0..2
  validates :name,
            presence: true,
            length: { maximum: 255 }
  has_secure_password
  validates :password,
            presence: true,
            length: { minimum: 6 },
            allow_nil: true

  # Doctor-specific record validation
  validates :specialization,
            presence: true,
            length: { maximum: 255 },
            if: :is_doctor?
  # Regular expression matches numbers of form +XX XXXX XXXXXX | +XX XXXXX XXXXXX | XXXXX XXXXXX
  # Whitespaces are optional but cannot exceed a single space (impossible anyway due to stripping whitespace)
  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{2}\s?\d?\d{4}|\d{5})\s?\d{6}\z/i
  validates :phone,
            presence: true,
            format: { with: VALID_PHONE_NUMBER_REGEX },
            if: :is_doctor?
  validates :address,
            presence: true,
            if: :is_doctor?
  validates :bio,
            presence: true,
            allow_blank: true,
            if: :is_doctor?

  # Patient-specific record validation
  validates :dob, :nationality, :marital_status, :hobbies, :languages, :age, :height, :weight, :allergies, :smoke, :alcohol, :tattoos, :history, :medication, :illness,
            presence: true,
            if: :is_patient?
  validates :occupation,
            presence: true,
            length: { maximum: 255 },
            if: :is_patient?
  validates :drugs,
            inclusion: { in: [true, false] },
            if: :is_patient?

private

  def downcase_email
    email.downcase!
  end

  def is_doctor?
    user_group == 2
  end

  def is_patient?
    user_group == 1
  end
end
