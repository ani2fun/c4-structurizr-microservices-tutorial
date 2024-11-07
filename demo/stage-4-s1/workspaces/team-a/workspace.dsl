# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../system-catalog/system-catalog.dsl {

    name "Stage - 4 - Strategy - 1 - For Enterprise - Team A's - Software System."
    description "The software architecture of Team A which deals with some complex systems implementing business capability A - Using Extensions of a common Model. Independently Developed."

    model {
        !element software_system_a {
            service_A_api = container "Service A API" {
                technology "SpringBoot"
                description "Implements Business logic for Capability A"
                someController = component "Some Controller" "Allows users to send request to System A." "SpringBoot Rest Controller"
            }

            service_A_database = container "Service A Database Schema" {
                technology "PostgreSQL"
                description "Stores data related to capabilities A"
            }

            user -> service_A_api "User calling Service A API directly by passing Software X"
            software_system_x -> service_A_api "System X is Calling"
            someController -> service_A_database "Controller queries data via sql query."
            service_A_api -> service_A_database "Read From and Write To"
            service_A_api -> software_system_kafka.topic_a "Publishes data to Kafka Topic A"
        }
    }

    views {

        systemContext software_system_a "Context_View_A" {
            include *
            autoLayout
        }

        container software_system_a "Container_View_A" {
            include *
            autoLayout
        }

        dynamic software_system_a "Context_Scope_Dynamic_View_A" {
            title "System context scope: Some dynamic view of A."
            description "Summarises how the feature works application."
            user -> service_A_api "Submits request to"
            service_A_api -> service_A_database "Read From and Write To"
            service_A_api -> software_system_kafka.topic_a "Publishes data to Kafka Topic A"
            autoLayout
        }

        dynamic service_A_api "Container_Scope_Dynamic_View_A" {
            autoLayout
            title "Container scope: Some dynamic view of A."
            description "Summarises how the feature works application."
            someController -> service_A_database "Controller get data using sql query."
        }

    }

}