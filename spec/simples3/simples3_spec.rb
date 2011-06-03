require 'spec_helper'

describe Simples3 do
  
  it "should load Simples3" do
    Simples3.should_not be_nil
  end
  
  it "should fail without config file" do
    lambda {
      Simples3.ensure_connection
    }.should raise_error Simples3::Config
  end
  
end