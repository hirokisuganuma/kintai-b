require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:one)
    @work = Work.new(
      user_id:@user.id,
      attendance_time:"2019,4,30,09:00:00",
      leaving_time:"2019,4,30,18:00:00",
      day:"2019,4,30",
      remarks:"test",
      )
  end

  test "shold be valid" do
    assert @work.valid?
  end

  test "user id shold be present" do
    @work.user_id = nil
    assert_not @work.valid?
  end

end 
