require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    example "名前は3文字異常" do
      user = User.new(name: "ab")
      expect(user).not_to be_valid
    end
  end
end
