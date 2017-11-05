require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to :book }
  it { should validate_presence_of :file }
end
