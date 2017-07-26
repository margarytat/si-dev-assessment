class PagesController < ApplicationController
  def home
  end

  def sms
    # byebug is nice but params are also displayed in the error message
    # raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
  end
end
