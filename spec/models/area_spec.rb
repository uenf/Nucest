require 'spec_helper'

describe Area do
  should_have_many :children, :dependent => :destroy
  should_belong_to :father
end

