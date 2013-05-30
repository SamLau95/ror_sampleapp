require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign') }
    it { should have_selector('title', text: 'Sign') }
  end

  describe 'sign in' do
    before { visit signin_path }

    describe 'with invalid information' do
      before { click_button 'Sign In' }

      it { should have_selector('title', text: 'Sign') }
      it { should have_error_message('Invalid') }

      describe 'after visiting another page' do
        before { click_link 'Home' }
        it { should_not have_selector 'div.alert.alert-error' }
      end

    end

    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
    end
  end
end