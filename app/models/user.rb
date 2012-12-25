# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # store_configurable
  extend UserExtend
  extend OmniauthCallbacks

  store :_config, :accessors => [:location, :tagline, :first_name, :last_name, :daily_scores, :scores, :ability]

  has_many :quizzes, :dependent => :nullify
  has_many :responses, :dependent => :destroy
  has_many :options, :dependent => :nullify
  has_many :answers, :dependent => :destroy

  has_many :questions

  has_many :skills
:a
  has_many :abilities, :class_name => 'Ability'

  #  def to_param
  #    username
  #  end

  def ability_about!(obj)
    if ability = ability_about(obj)
    else
      ability = self.abilities.create!(:objectable_type => obj.class.base_class.to_s, :objectable_id => obj.id)
    end
    ability.save
    return ability
  end

  def ability_about(obj)
    # obj: skill, question
    ability = abilities.where(["objectable_type = ? and objectable_id = ?", obj.class.base_class.name, obj.id]).first
  end

  def _ability_value(obj)
    if ability_value = ability_about(obj)
      ability_value.value
    end
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :login, :email, :password, :password_confirmation, :remember_me
  has_many :authorizations, :dependent => :destroy

  validates_uniqueness_of :login
  validates_presence_of :login
  validates_format_of :login, :with => /^[A-Za-z\d\s]+$/#, :message => '只能是字母及空白'

  def username; login.split(' ').join('.'); end
  alias_method :title, :username

  private

  def update_scores!
    # 如何在積分上加權
    self.daily_scores = responses.where(['created_at > ?', 3.minutes.ago]).sum(:value)
    self.scores = responses.sum(:value)
    self.save
  end

end
