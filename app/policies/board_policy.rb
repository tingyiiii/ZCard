class BoardPolicy < ApplicationPolicy
  def hide?
    # 前面的user是防止沒登入時會改噴沒有role方法error
    user && user.role == 'bm' && record.user == user
  end

  def lock?
    hide?
  end

  def open?
    hide?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
