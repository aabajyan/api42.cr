class Project
  include JSON::Serializable

  property id : UInt64
  property parent_id : UInt64?
  property name : String
  property slug : String
end

class ProjectUser
  include JSON::Serializable

  property id : UInt64
  property occurrence : Int32
  property final_mark : Int32?
  property status : String
  property current_team_id : UInt64
  property project : Project
  property cursus_ids : Array(UInt64)
  property retirable_at : String?

  @[JSON::Field(key: "validated?")]
  property is_validated : Bool?
end
