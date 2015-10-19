class StaffMemberFormPresenter < UserFormPresenter
  def check_boxes
    markup(:div, class: 'input-block') do |m|
      m << check_boxe(:suspended)
      m << label(:suspended, 'アカウント停止')
    end
  end
end