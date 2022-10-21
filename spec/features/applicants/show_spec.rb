require 'rails_helper'

RSpec.describe "showpage" do 
  it 'blah blah' do 
    @shelter5 = Shelter.create!(name: "Pet Rock Shelter", city: "Boulder", rank: 1, foster_program: true)
    @pet1 = @shelter5.pets.create!(name: "Taco", breed: "Dachshund", age: 4, adoptable: true)
    @app1 = Applicant.create!(name: "Ashley Turner", street_address: "123 Oregon Trail Way", city: "Portland", state: "OR", zip_code: "54321", description: "Pet sitting and want to have my own")
    @pet_app1 = PetApplicant.create!(pet_id: @pet1.id, applicant_id: @app1.id)

    visit "/applicants/#{@app1.id}"

    expect(page).to have_content("#{@app1.name}")
    expect(page).to have_content("#{@app1.street_address}")
    expect(page).to have_content("#{@app1.city}")
    expect(page).to have_content("#{@pet1.name}")
    expect(page).to have_link("#{@pet1.name}")
  end
end