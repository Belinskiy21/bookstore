require 'rails_helper'

RSpec.describe Author, tupe: :model do
  it { should have_many(:author_books).dependent :destroy }
  it { should have_many(:books).through :author_books }
  it { should validate_presence_of :name }
end
