class TallySheet < ActiveRecord::Base
  
  belongs_to :voter, :polymorphic => true
  belongs_to :tallyable, :polymorphic => true, :counter_cache => true
  
  validates_uniqueness_of :tallyable_id, :scope => [:tallyable_type, :voter_type, :voter_id]
  validates_inclusion_of :for, :in => [true, false]
  
  after_save :update_tally_score!
  after_destroy :update_tally_score!
  
  attr_protected :voter, :tallyable
  
  # TODO: Figure out why i can't just reference :tallyable => tallyable
  named_scope :tally, lambda { |tallyable|
    { :conditions => { :tallyable_id => tallyable.id, :tallyable_type => tallyable.class.to_s } }
  }
  
  # TODO: Figure out why i can't just reference :tallyable => tallyable
  named_scope :voter, lambda { |voter|
    { :conditions => { :voter_id => voter.id, :voter_type => voter.class.to_s } }
  }
  
  def update_tally_score!
    self.tallyable.update_tally_score!
  end
  
end
