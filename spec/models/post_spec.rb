require 'rails_helper'

describe Post do
    it { should validate_presence_of :option_a_title}
    it { should validate_presence_of :option_b_title}
end
