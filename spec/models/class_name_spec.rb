require 'rails_helper'

RSpec.describe ClassName, :type => :model do
  it { should respond_to(
    :primary_class_relationships,
    :secondary_class_relationships,
    :secondary_rels,
    :primary_rels
  )}
end