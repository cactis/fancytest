# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'fluid'

  before_filter :authenticate_user!#, :only => [:authorizations, :contacts]

  before_filter :every_request
  def every_request
    debug [resources_name, resource_name, [controller_name, action_name], params], '[resources_name, resource_name, [controller_name, action_name], params]'
    User.current = current_user if current_user
  end

  def development? ; Rails.env.development? ? true : false; end
  helper_method :development?


  def supervisor
    User.order('id asc').first
  end
  def supervisor?
    User.current == supervisor
  end
  helper_method :supervisor?

  def debug(msg, title = 'debug info')
    return unless development?
    logger.ap '-'*30 + '-> ' + title
    logger.ap msg
    logger.ap '-'*30 + '-> ' + title
  end

  def resources_name; rname = request.env["PATH_INFO"].split('/')[1]; rname ? rname : 'welcomes'; end
  def resource_name; resources_name.singularize; end
  helper_method :resources_name, :resource_name
end
