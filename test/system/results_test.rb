require "application_system_test_case"

class ResultsTest < ApplicationSystemTestCase
  setup do
    @result = results(:one)
  end

  test "visiting the index" do
    visit results_url
    assert_selector "h1", text: "Results"
  end

  test "should create result" do
    visit results_url
    click_on "New result"

    fill_in "Match", with: @result.match_id
    fill_in "Team1 score", with: @result.team1_score
    fill_in "Team2 score", with: @result.team2_score
    fill_in "Winning team", with: @result.winning_team_id
    click_on "Create Result"

    assert_text "Result was successfully created"
    click_on "Back"
  end

  test "should update Result" do
    visit result_url(@result)
    click_on "Edit this result", match: :first

    fill_in "Match", with: @result.match_id
    fill_in "Team1 score", with: @result.team1_score
    fill_in "Team2 score", with: @result.team2_score
    fill_in "Winning team", with: @result.winning_team_id
    click_on "Update Result"

    assert_text "Result was successfully updated"
    click_on "Back"
  end

  test "should destroy Result" do
    visit result_url(@result)
    accept_confirm { click_on "Destroy this result", match: :first }

    assert_text "Result was successfully destroyed"
  end
end
