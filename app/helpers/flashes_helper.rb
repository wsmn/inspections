module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice("alert", "error", "notice", "success")
  end

  def bulma_notification(flash)
    case(flash)
    when('alert')
      'warning'
    when('error')
      'danger'
    when('notice')
      'info'
    when 'success'
      'success'
    else
      'primary'
    end
  end
end
