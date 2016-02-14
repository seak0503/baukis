require 'rails_helper'

feature 'スタッフによるアカウント管理' do
  include FeaturesSpecHelper
  let(:staff_member) { create(:staff_member) }

  before do
    switch_namespace(:staff)
    login_as_staff_member(staff_member)
    click_link 'アカウント'
    click_link 'アカウント情報編集'
  end

  scenario 'スタッフがアカウント情報を更新する' do
    fill_in 'メールアドレス', with: 'test@local.com'
    click_button '確認画面へ進む'
    click_button '訂正'
    fill_in 'staff_member_family_name', with: '山平'
    fill_in 'staff_member_family_name_kana', with: 'ヤマヒラ'
    click_button '確認画面へ進む'
    click_button '更新'

    staff_member.reload
    expect(staff_member.email).to eq('test@local.com')
    expect(staff_member.family_name).to eq('山平')
    expect(staff_member.family_name_kana).to eq('ヤマヒラ')
  end

  scenario 'スタッフがメールアドレスに無効な値を入力する' do
    fill_in 'メールアドレス', with: 'test@@com.'
    click_button '確認画面へ進む'

    expect(page).to have_css('header span.alert')
    expect(page).to have_css('div.field_with_errors input#staff_member_email')
  end
end