# -*- encoding : utf-8 -*-
class Answer < ActiveRecord::Base
  belongs_to :option, :counter_cache => true
  belongs_to :response, :foreign_key => 'paper_id', :class_name => 'Response'

  attr_accessible :option_id, :checked
  def prompt; option.prompt; end
end                 
