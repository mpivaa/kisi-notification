require './test/test_helper'

class RuleTest < MiniTest::Test
  def test_sucess_filter
    success_event = {
      success: true
    }
    failure_event = {
      success: false
    }

    rule = Rule.new(filters: {
      success: true
    })

    assert rule.match?(success_event)
    assert !rule.match?(failure_event)
  end

  def test_action_filter
    lock_event = {
      action: 'lock'
    }
    unlock_event = {
      action: 'unlock'
    }

    rule = Rule.new(filters: {
      action: 'unlock'
    })

    assert rule.match?(unlock_event)
    assert !rule.match?(lock_event)
  end

  def test_time_filter
    jan_event = {
      time: Date.new(2018, 1, 5)
    }
    feb_event = {
      time: Date.new(2018, 2, 5)
    }

    rule = Rule.new(filters: {
      time: (Date.new(2018, 1, 1)..Date.new(2018, 1, 10))
    })

    assert rule.match?(jan_event)
    assert !rule.match?(feb_event)
  end

  def test_object_type_filter
    door_event = {
      object_type: 'Door'
    }
    lock_event = {
      object_type: 'Lock'
    }

    rule = Rule.new(filters: {
      object_type: 'Door'
    })

    assert rule.match?(door_event)
    assert !rule.match?(lock_event)
  end

  def test_actor_email_filter
    user1_event = {
      actor_email: 'user1@email.com'
    }
    user2_event = {
      actor_email: 'user2@email.com'
    }

    rule = Rule.new(filters: {
      actor_email: 'user1@email.com'
    })

    assert rule.match?(user1_event)
    assert !rule.match?(user2_event)
  end
end
