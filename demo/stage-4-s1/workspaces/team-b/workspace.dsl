# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../system-catalog/system-catalog.dsl {

    name "Stage - 4 - Strategy -1 - For Enterprise - Team B's - Software System."
    description "The software architecture of Team B which deals with some complex systems implementing business capability B - Using Extensions of a common Model. Independently Developed."


    model {
        !element software_system_b {
            service_B_api = container "Service B API" {
                tags "Service B API"
                technology "SpringBoot"
                description "Implements Business logic for Capability B"
            }

            service_B_database = container "Service B Database Schema" {
                tags "Service B DB"
                technology "PostgreSQL"
                description "Stores data related to capabilities B"
            }

            software_system_x -> service_B_api "System X is Calling"
            service_B_api -> service_B_database "Read From and Write To"

            service_B_api -> software_system_kafka.topic_b "Publishes data to Kafka Topic B"
        }


    }


    views {
         systemContext software_system_b "Context_View_B" {
            include *
            autoLayout
        }

        container software_system_b "Container_View_B" {
            include *
            autoLayout
        }
    }

}