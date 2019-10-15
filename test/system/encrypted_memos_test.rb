require "application_system_test_case"

class EncryptedMemosTest < ApplicationSystemTestCase
  setup do
    @encrypted_memo = encrypted_memos(:one)
  end

  test "visiting the index" do
    visit encrypted_memos_url
    assert_selector "h1", text: "Encrypted Memos"
  end

  test "creating a Encrypted memo" do
    visit encrypted_memos_url
    click_on "New Encrypted Memo"

    fill_in "Body", with: @encrypted_memo.body
    fill_in "Title", with: @encrypted_memo.title
    fill_in "Uid", with: @encrypted_memo.uid
    click_on "Create Encrypted memo"

    assert_text "Encrypted memo was successfully created"
    click_on "Back"
  end

  test "updating a Encrypted memo" do
    visit encrypted_memos_url
    click_on "Edit", match: :first

    fill_in "Body", with: @encrypted_memo.body
    fill_in "Title", with: @encrypted_memo.title
    fill_in "Uid", with: @encrypted_memo.uid
    click_on "Update Encrypted memo"

    assert_text "Encrypted memo was successfully updated"
    click_on "Back"
  end

  test "destroying a Encrypted memo" do
    visit encrypted_memos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Encrypted memo was successfully destroyed"
  end
end
