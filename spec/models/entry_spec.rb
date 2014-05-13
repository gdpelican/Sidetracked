require 'spec_helper'

describe Entry do
  it "can determine if a field is used or not" do
    act = create :act
    act.should respond_to :uses
    act.uses(:subtitle).should eq false
  end
   
  it "should be able to access the database field 'title'" do
    testimonial = create :act, title: 'wark title', link: 'www.example.com'
    testimonial.should respond_to :raw_title
    testimonial.raw_title.should eq 'wark title'    
  end
  
  it "should be able to identify its type" do
    performer = create :performer
    performer.type.should eq 'Performer'
  end
  
  it "should be able to identify itself as a Gig entry" do  
    gig = create :gig
    gig.gig_entry.type.should eq 'GigEntry'
  end
  
  it "should have no unused fields by default" do
    Entry.should respond_to :unused
    Entry.unused.should have(0).items
  end
  
  it "should be able to filter by type" do
    performer = create :performer
    act = create :act
    
    Entry.should respond_to :of_type
    result = Entry.of_type :performer
    result.should include performer
    result.should_not include act
  end
  
end
