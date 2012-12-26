# -*- encoding : utf-8 -*-
class Quiz < ActiveRecord::Base
  acts_as_nested_set :dependent => :destroy, :counter_cache => true

  attr_accessible :prompt, :description, :logo, :location, :options_count, :responses_count

  has_attached_file :logo,
    :styles => { :medium => "160x160>", :thumb => "96x96>" },
    :path => ':rails_root/public/system/:class/:attachment/:id/:hash.:extension',
    :url => "/system/:class/:attachment/:id/:hash.:extension",
    :hash_secret => Settings.paperclip_hash_secret,
    :default_url => "/assets/logos/normal/missing.png"

  has_many :papers, :as => :paperable, :dependent => :destroy
  has_many :sheets, :as => :paperable

  has_many :questions, :foreign_key => 'parent_id', :dependent => :destroy
  has_many :authors, :through => :questions, :source => :user

  has_many :responses, :through => :questions

  validates_presence_of :prompt

  def location
    self[:location] ? self[:location] : "(無)"
  end

  def _info
    %Q(
    總題數：#{self.questions_count} 題,
    總答題次：#{self.responses_count} 題次,
    難度：#{self.location}<hr/>).html_safe
  end
end
