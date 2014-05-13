require 'spec_helper'

describe Link do
  
  before do
    
  end
  
  let(:social) { create :social, on_contact: true, name: 'Social' }
  let(:external) { create :external }
  
  it "should be able to filter by links on the contact page" do
    Link.should respond_to :on_contact
    
    result = Link.on_contact
    result.should include social
    result.should_not include external
  end
  
  it "should be able to find links by name" do
    social.reload
    Link.should respond_to :named
    Link.named('Social').should eq social
  end
  
end
