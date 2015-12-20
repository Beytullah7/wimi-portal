require 'rails_helper'



feature "First login as User" do
  background do
    @current_user = FactoryGirl.create(:user)
    login_as @current_user
  end

  scenario "Display all chairs" do
    chairs.each do |chair|
      expect(page).to have_content(chair.name)
    end
  end

  scenario "Change button layout after applying" do
    click_button("Bewerben")
    expect(page).to have_content("Gestellt")
  end

  scenario "Unique chair applications" do
    if have_content("Gestellt")
       click_button("Bewerben")
       expect(page).to have_content("Gestellt", count: 1)
    end
  end

end