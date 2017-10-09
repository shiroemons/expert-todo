require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    subject { build(:task) }

    it { is_expected.to validate_presence_of(:title) }
  end
end
