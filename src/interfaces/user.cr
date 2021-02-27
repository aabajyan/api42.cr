module Api42
  class User
    include JSON::Serializable

    property id : UInt64
    property email : String
    property login : String
    property first_name : String
    property last_name : String
    property usual_first_name : String?
    property url : String
    property phone : String
    property displayname : String
    property image_url : String
    property correction_point : Int32
    property pool_month : String?
    property pool_year : String?
    property location : String?
    property wallet : Int32
    property anonymize_date : String?
    property campus : Array(Campus)
    property campus_users : Array(CampusUser)
    property projects_users : Array(ProjectUser)
    property cursus_users : Array(CursusUser)

    @[JSON::Field(key: "staff?")]
    property is_staff : Bool
  end
end
