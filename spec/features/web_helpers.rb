def sign_in_and_play
  visit("/")
  fill_in :player_1_name, with: "Alfonso"
  fill_in :player_2_name, with: "Giorgi"
  click_button :Submit
end

def attack
  select 'Attack'
  click_button :Submit
end