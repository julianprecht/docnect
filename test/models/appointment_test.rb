require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @doctor = users(:doctor)
    @patient = users(:patient)
    @relation = Appointment.new(doctor: @doctor, patient: @patient)
  end

  test 'relation is valid and can be saved' do
    assert @relation.valid?
    assert @relation.save
  end

  test 'relation must have doctor' do
    @relation.doctor = nil
    assert_not @relation.valid?
  end

  test 'relation must have patient' do
    @relation.patient = nil
    assert_not @relation.valid?
  end

  test 'relation cannot be empty' do
    @relation.doctor = nil
    @relation.patient = nil
    assert_not @relation.valid?
  end

  test 'duplicate relations cannot exist' do
    @duplicate = @relation.dup
    @relation.save
    assert_not @duplicate.save
    assert_not @duplicate.valid?
  end
end
