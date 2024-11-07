# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../shared/system-catalog.dsl {

    name "Stage - 4 - Strategy -1 - For Enterprise - Team X's - Software System."
    description "UI and some business Logic. Independently handles by Team X. Deals with implementing business capability A, B, C and D - Using Extensions of a common Model."

    model {
        !element software_system_x {
            web_app = container "Web App" {
                technology "Java and Spring MVC"
                description "Implements UI and business logic for capabilities A, B, C and D"
                somePage = component "Some Page" "Allows users to View this page." "Spring MVC Some Page."
            }

            user -> web_app "Calls X (via Web app) to do A,B and C"
            user -> somePage "User View this page."
            web_app -> software_system_a "Calling A Using JSON/HTTPS" "service-A-api"
            somePage -> software_system_a "Some page of web app interacts with System A via" "service-A-api"
        }

    }

    views {

        systemContext software_system_x "Context_View_X" {
            include *
            autoLayout
        }

        container software_system_x "Container_View_X" {
            include *
            autoLayout
        }

        dynamic web_app "Container_Scope_Dynamic_View_X" {
            autoLayout
            title "Container scope: Some dynamic view of X."
            description "Summarises how the feature works application."
            somePage -> software_system_a "Some page Sends data to System A"
        }

        systemcontext software_system_kafka "Context_View_Kafka" {
            include *
            autoLayout
            description "System context diagram for: Kafka."
        }

        container software_system_kafka "Container_View_Kafka" {
            include *
            autoLayout lr
            description "Container diagram for: Team kafka."
        }

    }

}