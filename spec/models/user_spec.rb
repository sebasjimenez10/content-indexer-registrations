# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'Validations' do
    it { should validate_presence_of(:email) }

    context 'without a password' do
      subject { build(:user, password: '') }

      it { should validate_presence_of(:password) }
    end
  end

  describe 'Methods' do
    it { should respond_to(:authenticate) }
  end
end
