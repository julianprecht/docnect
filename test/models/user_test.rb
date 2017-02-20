require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @super = User.create!(email: 'test_super@test.com', user_group: 0, name: 'Super User', password: 'foobar', password_confirmation: 'foobar')
    @doctor = User.create!(email: 'test_doctor@test.com', user_group: 2, name: 'Doctor', password: 'foobar', password_confirmation: 'foobar', specialization: 'test specialization', phone: '00000 000000', address: 'test address', bio: 'test bio')
    @patient = User.create!(email: 'test_patient@test.com', user_group: 1, name: 'Patient', password: 'foobar', password_confirmation: 'foobar', dob: Time.zone.now, nationality: 'test nationality', marital_status: 'test marital status', occupation: 'test occupation', hobbies: 'test hobbies', languages: 'test languages', age: 44, height: 180, weight: 70, allergies: 'test allergies', smoke: 'test smoke', alcohol: 'test alcohol', tattoos: 'test tattoos', history: 'test history', medication: 'test medication', drugs: false, illness: 'test illness')
  end

  test 'super user is valid' do
    assert @super.valid?
  end

  test 'doctor is valid' do
    assert @doctor.valid?
  end

  test 'patient is valid' do
    assert @patient.valid?
  end

  # For simplicity, super user is used to test all global user validation (not specific to user group)
  test 'user must have valid email' do
    valid_emails = %w[user@test.com user.test@test.ac.uk u@test.co user-test@test.com user_test@test.com user_test-2@test.com user+test@test.com]
    valid_emails.each do |valid|
      @super.email = valid
      assert @super.valid?, "#{valid.inspect} should be a valid email address"
    end

    invalid_emails = %w[@test.com test@.com test.com test@test]
    invalid_emails << 'a' * 256 << ''
    invalid_emails.each do |invalid|
      @super.email = invalid
      assert_not @super.valid?, "#{invalid.inspect} should not be a valid email address"
    end
  end

  test 'email addresses should be unique and case insensitive' do
    duplicate_user = @super.dup
    @super.save
    assert_not duplicate_user.valid?, "#{duplicate_user.email.inspect} is not unique so should be invalid"

    duplicate_user.email = @super.email.upcase
    assert_not duplicate_user.valid?, "#{duplicate_user.email.inspect} is not unique (case-insensitive) so should be invalid"
  end

  test 'email addresses are saved in lowercase' do
    mixed_case_email = 'TestUser@test.com'
    @super.email = mixed_case_email
    @super.save
    assert_equal mixed_case_email.downcase, @super.reload.email
  end

  test 'user has name of valid length' do
    invalid_names = ['', 'a' * 256]
    invalid_names.each do |invalid|
      @super.name = invalid
      assert_not @super.valid?, "#{invalid.inspect} should not be a valid name"
    end
  end

  test 'password should be present' do
    @super.password = @super.password_confirmation = ' ' * 6
    assert_not @super.valid?
  end

  test 'user password of valid length' do
    @super.password = @super.password_confirmation = 'a' * 5
    assert_not @super.valid?
  end

  test 'password and confirmation must match' do
    @super.password = 'password'
    @super.password_confirmation = 'foobar'
    assert_not @super.valid?
  end

  test 'doctor specialization is of valid length' do
    invalid_specs = ['', 'a' * 256]
    invalid_specs.each do |invalid|
      @doctor.specialization = invalid
      assert_not @doctor.valid?, "#{invalid.inspect} should not be a valid specialization"
    end
  end

  test 'doctor phone number must be valid' do
    valid_numbers = ['+441928110011', '+44 01928 110011', '01928 110011']
    valid_numbers.each do |valid|
      @doctor.phone = valid
      assert @doctor.valid?, "#{valid.inspect} should be a valid phone number"
    end

    invalid_numbers = ['+44 1928 110', '1928 110011', '44 01928 110011', '++44 01928 110011', '', 'a']
    invalid_numbers.each do |invalid|
      @doctor.phone = invalid
      assert_not @doctor.valid?, "#{invalid.inspect} should not be a valid phone number"
    end
  end

  test 'doctor address must exist and cannot be blank' do
    @doctor.address = ''
    assert_not @doctor.valid?

    @doctor.address = nil
    assert_not @doctor.valid?
  end

  test 'doctor bio can be blank' do
    bios = ['', 'a', 'a' * 256, 'a' * 1000]
    bios.each do |bio|
      @doctor.bio = bio
      assert @doctor.valid?, "#{bio.inspect} should be a valid doctor bio"
    end
  end

  ################################
  # PATIENT VALIDATION TESTS TBC #
  ################################
end
