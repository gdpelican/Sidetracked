require 'spec_helper'

describe Entry do
  it "can determine if a field is used or not" do
    act = create :act
    expect(act).to respond_to :uses
    expect(act.uses(:subtitle)).to eq false
  end
   
  it "should be able to access the database field 'title'" do
    testimonial = create :act, title: 'wark title', link: 'www.example.com'
    expect(testimonial).to respond_to :raw_title
    expect(testimonial.raw_title).to eq 'wark title'    
  end
  
  it "should be able to identify its type" do
    performer = create :performer
    expect(performer.type).to eq 'Performer'
  end
  
  it "should be able to identify itself as a Gig entry" do  
    gig = create :gig
    expect(gig.gig_entry.type).to eq 'GigEntry'
  end
  
  it "should have no unused fields by default" do
    expect(Entry).to respond_to :unused
    expect(Entry.unused.length).to eq 0
  end
  
  it "should be able to filter by type" do
    performer = create :performer
    act = create :act
    
    expect(Entry).to respond_to :of_type
    result = Entry.of_type :performer
    expect(result).to include performer
    expect(result).to_not include act
  end
  
end
