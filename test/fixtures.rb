class Fixtures
  def event_payload
    {
      "actor_type": "User",
      "actor_id": 1,
      "action": "unlock",
      "object_type": "Lock",
      "object_id": 1,
      "success": "true",
      "code": "ffffff",
      "message": "carl@kisi.io unlocked lock Entrance Door",
      "references": [
        {
          "type": "Place",
          "id": 1
        },
        {
          "type": "Lock",
          "id": 1
        }
      ],
      "created_at": ""
    }
  end
end
