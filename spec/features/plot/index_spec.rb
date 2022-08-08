require 'rails_helper'

describe "plot index" do
  it "displays each plot and the plants in the plot" do
    garden1 = Garden.create!(name: "Osage Gardens", organic: true)
    plot1 = Plot.create!(number: 1, size: "Medium", direction: "West", garden_id: garden1.id)
    plot2 = Plot.create!(number: 2, size: "Large", direction: "North", garden_id: garden1.id)
    plot3 = Plot.create!(number: 3, size: "Large", direction: "North", garden_id: garden1.id)
    plant1 = Plant.create!(name: "Sage", description: "Smells nice", days_to_harvest: 10, plots_id: plot1.id)
    plant2 = Plant.create!(name: "Snap Peas", description: "Crunchy", days_to_harvest: 10, plots_id: plot2.id)
    plant3 = Plant.create!(name: "Kale", description: "Iron rich", days_to_harvest: 10, plots_id: plot1.id)
    plant4 = Plant.create!(name: "Spinach", description: "Smells nice", days_to_harvest: 10, plots_id: nil)

    visit '/plots'

    expect(page).to have_content("Plot ##{plot1.number}")
    expect(page).to have_content("#{plant1.name}")
    expect(page).to_not have_content("#{plant4.name}")
  end

  it "displays each plot and the plants in the plot" do
    garden1 = Garden.create!(name: "Osage Gardens", organic: true)
    plot1 = Plot.create!(number: 1, size: "Medium", direction: "West", garden_id: garden1.id)
    plot2 = Plot.create!(number: 2, size: "Large", direction: "North", garden_id: garden1.id)
    plot3 = Plot.create!(number: 3, size: "Large", direction: "North", garden_id: garden1.id)
    plant1 = Plant.create!(name: "Sage", description: "Smells nice", days_to_harvest: 10, plots_id: plot1.id)
    plant2 = Plant.create!(name: "Snap Peas", description: "Crunchy", days_to_harvest: 10, plots_id: plot2.id)
    plant3 = Plant.create!(name: "Kale", description: "Iron rich", days_to_harvest: 10, plots_id: plot1.id)
    plant4 = Plant.create!(name: "Spinach", description: "Smells nice", days_to_harvest: 10, plots_id: nil)

    visit '/plots'
    save_and_open_page
    expect(page).to have_link("REMOVE")
  end
end
