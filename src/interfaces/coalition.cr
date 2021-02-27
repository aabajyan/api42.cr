module Api42
    class Coalition
        include JSON::Serializable

        property id : UInt64
        property user_id : UInt64
        property name : String
        property slug : String
        property image_url : String
        property cover_url : String
        property color : String
        property score : Int64
    end
end