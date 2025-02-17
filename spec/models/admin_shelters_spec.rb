require 'rails_helper'

RSpec.describe "AdminShelters" do 
  describe 'rev alpha-US 10' do 
    it 'uses raw sql to list shelter names reverse alphabetically' do 
      shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
      shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

      expect(Shelter.rev_alpha).to eq([shelter_2, shelter_3, shelter_1])
    end
  end

  describe 'US 11' do 
    it 'shows the name of every shelter that has a pending application' do 
      shelter5 = Shelter.create!(name: "Pet Rock Shelter", city: "Boulder", rank: 1, foster_program: true)
      shelter6 = Shelter.create!(name: "ASPCA", city: "Las Vegas", rank: 3, foster_program: true)
      pet1 = shelter5.pets.create!(name: "Taco", breed: "Dachshund", age: 4, adoptable: true)
      pet2 = shelter6.pets.create!(name: "Sergio", breed: "Mutt", age: 16, adoptable: true)
      app1 = Applicant.create!(name: "Ashley Turner", street_address: "123 Oregon Trail Way", city: "Portland", state: "OR", zip_code: "54321", description: "Pet sitting and want to have my own", status: "Pending")
      app2 = Applicant.create!(name: "Kristen Nestler", street_address: "4786 Yankee Way", city: "New York", state: "NY", zip_code: "02134", description: "Being single is lonely.", status: "In Progress")
      pet_app1 = PetApplicant.create!(pet_id: pet1.id, applicant_id: app1.id)
      pet_app2 = PetApplicant.create!(pet_id: pet2.id, applicant_id: app2.id)


      expect(Shelter.pending_apps).to eq([shelter5])
    end
  end
end