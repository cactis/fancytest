# -*- encoding : utf-8 -*-
class Attach < ActiveRecord::Base
  has_attached_file :logo,
    :path => ':rails_root/public/system/:class/:attachment/:id/:hash.:extension',
    :url => "/system/:class/:attachment/:id/:hash.:extension",
    :hash_secret => Settings.paperclip_hash_secret,
    :default_url => "/assets/attaches/normal/missing.png"
end
