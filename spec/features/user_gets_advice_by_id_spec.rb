require 'rails_helper'

describe "As a user, visiting the site" do
  it "sees advice after submitting a query string" do
    id = 3
    visit root_path

    expect(page).to have_field(:favorite_number)

    fill_in :favorite_number, with: id

    click_on("Get Advice by Number")
    expect(page).to have_content("Don't eat non-snow-coloured snow.")
  end
  it "sees notice after submitting a query string that does not exist" do
    id = 550
    visit root_path

    expect(page).to have_field(:favorite_number)

    fill_in :favorite_number, with: id

    click_on("Get Advice by Number")
    expect(page).to have_content("Advice slip not found.")
  end
end
