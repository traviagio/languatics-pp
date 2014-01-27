require 'spec_helper'

def login(user)
  login_as user, scope: :user
end