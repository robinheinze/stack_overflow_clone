require 'spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should belong_to :user }
  it { should validate_presence_of :content }
end
