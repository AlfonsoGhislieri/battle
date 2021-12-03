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
		expect(page).to have_content "Alfonso Attack"
	end

	scenario "Player1's attack reduces Player2's health" do
		sign_in_and_play
		attack
		click_button :Continue
		expect(page).to_not have_content "Giorgi: 60hp"
	end

	scenario "Player2's attack reduces Player1's health" do
		sign_in_and_play
		2.times { 
		attack
		click_button :Continue }
		expect(page).to_not have_content 'Alfonso: 60hp'
	end

	scenario "Player1 current turn" do
		sign_in_and_play
		expect(page).to have_content "Alfonso's turn"
	end

	scenario "Turn changes after player1 attacks" do
		sign_in_and_play
		attack
		click_button :Continue
		expect(page).to have_content "Giorgi's turn"
	end

	scenario "Lose page shows if player health drops to 0" do
		sign_in_and_play
		15.times { 
			attack
			click_button :Continue }
		expect(page).to have_content "Lost"
	end

end
