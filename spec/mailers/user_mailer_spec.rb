require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'reset_password_email' do
    let!(:user) { create(:user) }
    let!(:token) { user.generate_reset_password_token! }
    let(:mail) { UserMailer.reset_password_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Your password has been reset')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['support@ts.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('You have requested to reset your password')
    end
  end
end
