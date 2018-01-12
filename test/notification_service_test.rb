require './test/test_helper'

class NotificationServiceTest < MiniTest::Test
  def test_notify
    unlock_event = {
      actor_type: "User",
      actor_id: 1,
      action: "unlock",
      object_type: "Lock",
      object_id: 1,
      success: false,
      code: "ffffff",
      message: "carl@kisi.io unlocked lock Entrance Door",
      references: [
        {
          type: "Place",
          id: 1
        },
        {
          type: "Lock",
          id: 1
        }
      ],
      created_at: ""
    }

    unlock_failure_rule = Rule.new(filters: {
      success: false,
      action: 'unlock'
    }, subscribers: ['m.pivaa@gmail.com'])

    lock_failure_rule = Rule.new(filters: {
      success: false,
      action: 'lock'
    }, subscribers: ['m.pivaa2@gmail.com'])

    Mail::TestMailer.deliveries.clear

    notification_service = NotificationService.new(unlock_event,
                       [unlock_failure_rule, lock_failure_rule])
    result_mail = notification_service.notify.flatten.first

    assert_equal result_mail[:to], 'm.pivaa@gmail.com', 'Wrong recipient'
    assert result_mail[:body].include?('m.pivaa@gmail.com'), 'Wrong body'
    assert Mail::TestMailer.deliveries.length === 1, 'Mail not sent'
  end
end
