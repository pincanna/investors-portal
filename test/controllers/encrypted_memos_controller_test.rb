require 'test_helper'

class EncryptedMemosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encrypted_memo = encrypted_memos(:one)
  end

  test "should get index" do
    get encrypted_memos_url
    assert_response :success
  end

  test "should get new" do
    get new_encrypted_memo_url
    assert_response :success
  end

  test "should create encrypted_memo" do
    assert_difference('EncryptedMemo.count') do
      post encrypted_memos_url, params: { encrypted_memo: { body: @encrypted_memo.body, title: @encrypted_memo.title, uid: @encrypted_memo.uid } }
    end

    assert_redirected_to encrypted_memo_url(EncryptedMemo.last)
  end

  test "should show encrypted_memo" do
    get encrypted_memo_url(@encrypted_memo)
    assert_response :success
  end

  test "should get edit" do
    get edit_encrypted_memo_url(@encrypted_memo)
    assert_response :success
  end

  test "should update encrypted_memo" do
    patch encrypted_memo_url(@encrypted_memo), params: { encrypted_memo: { body: @encrypted_memo.body, title: @encrypted_memo.title, uid: @encrypted_memo.uid } }
    assert_redirected_to encrypted_memo_url(@encrypted_memo)
  end

  test "should destroy encrypted_memo" do
    assert_difference('EncryptedMemo.count', -1) do
      delete encrypted_memo_url(@encrypted_memo)
    end

    assert_redirected_to encrypted_memos_url
  end
end
