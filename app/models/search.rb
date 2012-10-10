# == Schema Information
# Schema version: 20120506083309
#
# Table name: searches
#
#  id                     :integer          not null, primary key
#  participant_id         :integer
#  confidence_discrete    :integer
#  answer_discrete        :text
#  confidencewhy_discrete :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  step                   :integer          default(0)
#  ad_test                :integer
#

require "rubygems"

class Search < ActiveRecord::Base
  attr_accessible :answer_discrete, :confidence_discrete, :confidencewhy_discrete
        
  belongs_to :participant, :class_name => "Participant", :foreign_key => "participant_id"
  
  before_validation(:on => :create) do
    self.ad_test = rand(2)
  end
  
  validates_presence_of :ad_test
  # validates_presence_of :participant_id

  validates_presence_of :answer_discrete, :if => Proc.new{ |f| f.step > 0 }
  
  validates_presence_of :confidence_discrete, :if => Proc.new{ |f| f.step > 1 }
  validates_presence_of :confidencewhy_discrete, :if => Proc.new{ |f| f.step > 1 }
    
  has_many :source_evaluations, :class_name => "SourceEvaluation", :foreign_key => "search_id", :dependent => :destroy
  accepts_nested_attributes_for :source_evaluations, :reject_if => :all_blank
  attr_accessible :source_evaluations_attributes
end
