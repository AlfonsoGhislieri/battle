feature "battle game" do
	scenario "seeing inputted names" do
		sign_in_and_play
		expect(page).to have_content "Alfonso vs. Giorgi"
	end

	scenario "Showing player health" do
		sign_in_and_play
		expect(page).to have_content "Giorgi: 60hp"
	end

	scenario "Player1 attacks Player2 and gets confirmation" do
		sign_in_and_play
		attack
		expect(page).to have_content "Alfonso Attack Giorgi"
	end

	scenario "Player1's attack reduces Player2's health by 10" do
		sign_in_and_play
		attack
		click_button :Continue
		expect(page).to have_content 'Giorgi: 50hp'
	end

	scenario "Player1 current turn" do
		sign_in_and_play
		expect(page).to have_content "Alfonso's turn"
	end
end
