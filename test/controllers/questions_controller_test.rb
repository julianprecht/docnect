require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @patient = users(:patient)
    log_in_as @patient
  end

  test 'should get test' do
    get test_url
    assert_response :success
  end

end
