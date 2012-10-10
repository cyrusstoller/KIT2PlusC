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

require 'spec_helper'

describe Search do
  
  def step0_attributes
    { :answer_discrete => "text" }
  end
  
  def step1_attributes
    { :confidence_discrete => 12, :confidencewhy_discrete => "blah" }
  end
  
  describe "nested_attributes" do
    before(:each) do
      @participant = FactoryGirl.create(:participant)
    end
    it "should create a source evaluation" do
      s_attrs = { :familiarity => 12, :utility => 34, :accessibility => 67, :trust => 87, :source_id => 1, :time_spent => 10 }
      attrs = step0_attributes.merge(step1_attributes).merge({ :source_evaluations_attributes => [s_attrs] })
      s = @participant.build_search(attrs)
      s.save
      s.source_evaluations.count.should == 1
      Search.count.should == 1
      SourceEvaluation.count.should == 1
    end
    
    it "should not create a source evaluation" do
      s_attrs = { :familiarity => "", :utility => "", :accessibility => "", :trust => "", :source_id => 1 }
      attrs = step0_attributes.merge(step1_attributes).merge({ :source_evaluations_attributes => [s_attrs] })
      s = @participant.build_search(attrs)
      s.save
      s.source_evaluations.count.should == 0
      Search.count.should == 0
      SourceEvaluation.count.should == 0
    end
    
    it "should not create a search" do
      s_attrs = { :familiarity => "", :utility => "1", :accessibility => "", :trust => "", :source_id => 1 }
      attrs = step0_attributes.merge(step1_attributes).merge({ :source_evaluations_attributes => [s_attrs] })
      s = @participant.build_search(attrs)
      s.save
      Search.count.should == 0
      SourceEvaluation.count.should == 0
    end
  end
end
