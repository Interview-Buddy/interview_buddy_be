require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe 'relationships' do
    it { should have_many(:users).through(:user_meetings)}
  end

  describe 'validations' do
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :alum_id }
    it { should validate_presence_of :interview_type }
  end
end
