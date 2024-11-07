workspace extends ../../shared/system-catalog.dsl {
    name "Stage - 4 - Team E's: Strategy - 2 - For Enterprise"
    description "Aggregated workspace of all systems."

    model {
        !element software_system_x {
            !include ../team-x/fragments/model.dsl
        }

        !element software_system_a {
            !include ../team-a/fragments/model.dsl
        }

        !element software_system_b {
            !include ../team-b/fragments/model.dsl
        }

        !element software_system_c {
            !include ../team-c/fragments/model.dsl
        }

        !element software_system_d {
            !include ../team-d/fragments/model.dsl
        }

        // SOME RELATIONSHIPS WHICH WERE NOT POSSIBLE AT INDIVIDUAL WORKSPACE LEVEL
        web_app -> service_A_api "Web App from X is Calling to Service API over" "HTTPS/JSON"

        somePage -> someController "Component of Web App to Component of Team A's Service API"

    }

    views {
        systemlandscape "EnterpriseLandscape_view_of_all_systems" {
            title "[System Landscape] View of All Systems"
            include *
            autoLayout
        }

        container software_system_x "software_system_x_container_view" {
            include user web_app service_A_api software_system_kafka.topic_a
            autolayout
        }

        component web_app "web_app_component_view" {
            include user somePage someController service_A_database
            autolayout
        }

        component service_A_api "service_A_api_component_view" {
            include user somePage someController service_A_database
            autolayout
        }

    }
}