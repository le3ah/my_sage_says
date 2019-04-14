require 'rails_helper'

describe  "As a user, visiting the site" do
  it "sees random advice after clicking the submit button" do
    visit root_path

    click_on("Get Random Advice")
    expect(current_path).to eq("/random")

    click_on("Return to Welcome for More Advice")
    expect(current_path).to eq(root_path)
  end
end
