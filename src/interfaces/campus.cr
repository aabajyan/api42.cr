module Api42
  class Campus
    include JSON::Serializable

    property id : UInt64
    property name : String
  end

  class CampusUser
    include JSON::Serializable

    property id : UInt64
    property user_id : UInt64
    property campus_id : UInt64
    property is_primary : Bool
  end
end
