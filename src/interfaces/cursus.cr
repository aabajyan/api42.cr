module Api42
  class Cursus
    include JSON::Serializable

    property id : UInt64
    property name : String
    property slug : String
    property created_at : String
  end

  class CursusUser
    include JSON::Serializable

    property level : Float32
    property grade : String?
    property blackholed_at : String?
    property begin_at : String
    property end_at : String?
    property cursus : Cursus
  end
end
