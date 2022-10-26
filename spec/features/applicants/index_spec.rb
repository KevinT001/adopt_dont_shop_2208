require 'rails_helper'

RSpec.describe "Applicant Index Page" do 
  
  it 'Shows applicant information for all applicants' do 
    app1 = Applicant.create!(name: "Ashley Turner", street_address: "123 Oregon Trail Way", city: "Portland", state: "OR", zip_code: "54321", description: "Pet sitting and want to have my own")
    app2 = Applicant.create!(name: "Kevin Ta", street_address: "2208 Repeater Dr", city: "Aurora", state: "CO", zip_code: "80011", description: "I love Corgi's, can I haz?")
    visit "/applicants"

      expect(page).to have_content("#{app1.name}" )
      expect(page).to have_content("#{app2.name}" )
  end
end