# frozen_string_literal: true

class Admin::BasisController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout 'admin'

  protected

  def check_admin
    redirect_to root_path, alert: 'You have\'t rights to view this page.' unless current_user.admin?
  end
end
