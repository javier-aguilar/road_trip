require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit /trips" do
    before :each do
      @trip1 = Trip.create(title: "Summer Vacation", destination: "Paris", mileage: 4881)
      @trip2 = Trip.create(title: "Spring Break", destination: "Aspen", mileage: 200)
      @trip3 = Trip.create(title: "Disney World 2022", destination: "Orlando", mileage: 1840)
    end
    it "I see titles of all trips listed in order of their mileage (asc order)" do
      visit "/trips"

      within '.trips' do
        expect(page.all('.trip-info')[0]).to have_content("#{@trip2.title}")
        expect(page.all('.trip-info')[1]).to have_content("#{@trip3.title}")
        expect(page.all('.trip-info')[2]).to have_content("#{@trip1.title}")
      end
    end
  end
end