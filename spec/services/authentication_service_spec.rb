require 'spec_helper'

describe AuthenticationService do
  describe '#register' do
    let(:auth_params) {
      { nick_name: 'nickname',
        email: 'peter@griffin.com',
        password: 'password' }.with_indifferent_access
    }

    context 'registers new user' do
      let(:service) { described_class.new(auth_params) }
      before { expect( described_class ).to receive(:generate_auth_token) { 'token' } }

      specify do
        user = service.register

        expect( user.valid? ).to               eq true
        expect( user.nick_name ).to            eq 'nickname'
        expect( user.email ).to                eq 'peter@griffin.com'
        expect( user.auth_token ).to           eq 'token'
      end
    end

    context 'user is already registered' do
      let(:service) { described_class.new(auth_params) }
      before { create :user, email: 'peter@griffin.com' }

      specify do
        expect( service.register ).to eq nil
      end
    end
  end
end