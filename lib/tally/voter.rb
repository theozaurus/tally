module Tally
  module Voter
    def self.included base
      base.extend ClassMethods
    end
    
    module ClassMethods
      def is_voter
        include InstanceMethods
        has_many :votes, :as => :voter, :class_name => "TallySheet"
        has_many :votes_for, :as => :voter, :class_name => "TallySheet", :conditions => {:for => true}
        has_many :votes_against, :as => :voter, :class_name => "TallySheet", :conditions => {:for => false}      
      end
    end

    module InstanceMethods
      
      def vote_for tallyable
        vote tallyable, true
      end
      
      def vote_against tallyable
        vote tallyable, false
      end
      
      def vote tallyable, value
        # TODO: Figure out why i can't just reference :tallyable => tallyable
        votes.tally(tallyable).find(:first).try(:update_attribute, :for, value) || 
          votes.create(:tallyable_id => tallyable.id, :tallyable_type => tallyable.class.to_s, :for => value)
      end
      
      def vote_destroy tallyable 
        votes.tally(tallyable).find(:first).try(:destroy)
      end
      
      def voted_for? tallyable
        !!votes.tally(tallyable).find(:first, :conditions => {:for => true})
      end
      
      def voted_against? tallyable
        !!votes.tally(tallyable).find(:first, :conditions => {:for => false})
      end
      
      def voted_on? tallyable
        !!votes.tally(tallyable).find(:first)
      end

    end
  end
end

# Set it all up.
if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.send(:include, Tally::Voter)
end
