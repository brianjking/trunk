Given(/^I am on the notes page$/) do
  visit notes_path
end

Given(/^I click "(.*?)"$/) do |text|
  click_on text
end

Given(/^I fill in the note title with "(.*?)"$/) do |note_title|
  fill_in "note_title", with: note_title
end

Given(/^I fill in the note content with "(.*?)"$/) do |note_content|
  fill_in "note_content", with: note_content
end

Then(/^the note "(.*?)" should have been created$/) do |note_title|
  expect(Note.where(title: note_title).count).to eq(1)
end

Then(/^there should be (\d+) note/) do |note_count|
  page.has_css? '#sidebar .sidebar-item', count: note_count
end

Then(/^I should be on the note page for "(.*?)"$/) do |note_title|
  id = Note.find_by(title: note_title).id
  assert page.current_path == edit_note_path(id)
end

Then(/^the content of note "(.*?)" should be "(.*?)"$/) do |title, content|
  note = Note.find_by(title: title)
  assert note.content == content
end
