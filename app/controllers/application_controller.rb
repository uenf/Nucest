# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  include Breadcrumbs
  before_filter :authenticate_usuario!, :except => [ :findar_convenios ]
end

