# -*- encoding : utf-8 -*-
class Sheet < Paper
  belongs_to :quiz, :polymorphic => true
  belongs_to :exam, :polymorphic => true
  belongs_to :skill, :polymorphic => true
end
