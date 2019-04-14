require 'rails_helper'

describe "As a user, visiting the site" do
  it "sees advice after submitting a query string" do
    query_string = "world"
    visit root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_field(:recent_dream)

    fill_in :recent_dream, with: query_string

    click_on("Get Advice")
    expect(page).to have_content("Smile and the world smiles with you. Frown and you're on your own.")
  end
  it "sees notice after submitting a query string that does not exist" do
    query_string = "jobs"
    visit root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_field(:recent_dream)

    fill_in :recent_dream, with: query_string

    click_on("Get Advice")
    expect(page).to have_content("No advice slips found matching that search term.")
  end
end
