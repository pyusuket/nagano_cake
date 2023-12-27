class Admin::HomesController < ApplicationController
  before_action :authenticate_customer!
end
