Given(/^I am on the notes page$/) do
  visit notes_path
end

Given(/^I am on the notes page, requesting JSON$/) do
  visit notes_path(format: :json)
end

Given(/^I am on the note page for "(.*?)", requesting JSON$/) do |note_title|
  note = Note.find_by(title: note_title)
  visit note_path(id: note.id, format: :json)
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

Then(/^there should be (\d+) note/) do |note_count|
  page.has_css? '#sidebar .sidebar-item', count: note_count
end

Then(/^I should be on the note page for "(.*?)"$/) do |note_title|
  id = Note.find_by(title: note_title).id
  assert page.current_path == edit_note_path(id)
end

Then(/^the content of note "(.*?)" should be "(.*?)"$/) do |title, content|
  note = Note.find_by(title: title)
  assert note.content.to_s == content
end

Given(/^I have a note called "(.*?)"$/) do |note_title|
  note = User.first.notes.create(title: note_title)
  content = Content.create(
    note_id: note.id,
    text_content: "Content goes here",
    content_type: :text
  )
  note.content_id = content.id
  note.save
end

Then(/^I should see a note called "(.*?)"$/) do |note_title|
  assert(page.has_content?(note_title), "Could not find note title")
end
