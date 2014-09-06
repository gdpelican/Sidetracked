require 'spec_helper'

describe Link do
  
  before do
    
  end
  
  let(:social) { create :social, on_contact: true, name: 'Social' }
  let(:external) { create :external }
  
  it "should be able to filter by links on the contact page" do
    expect(Link).to respond_to :on_contact
    
    result = Link.on_contact
    expect(result).to include social
    expect(result).to_not include external
  end
  
  it "should be able to find links by name" do
    social.reload
    expect(Link).to respond_to :named
    expect(Link.named('Social')).to eq social
  end
  
end
