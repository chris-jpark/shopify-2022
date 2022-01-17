module InventoriesHelper
    def location_type(location_type)
        if location_type == "Toronto"
            content_tag :span, "#{location_type}", class: "location-is-1"
        elsif location_type == "Montreal"
            content_tag :span, "#{location_type}", class: "location-is-2"
        elsif location_type == "Vancouver"
            content_tag :span, "#{location_type}", class: "location-is-3"
        else
            ""
        end
    end
end