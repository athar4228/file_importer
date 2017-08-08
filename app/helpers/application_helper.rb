module ApplicationHelper

  def alert_class(alert_type)
    {
      success: 'success',
      error: 'danger',
      alert: 'warning',
      notice: 'success',
    } [alert_type.to_sym]
  end
end
