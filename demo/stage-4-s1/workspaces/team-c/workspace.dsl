# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../system-catalog/system-catalog.dsl {

    name "Stage - 4 - Strategy -1 - For Enterprise - Team C's - Software System."
    description "The software architecture of Team C which deals with some complex systems implementing business capability C - Using Extensions of a common Model. Independently Developed."


    model {
        !element software_system_c {
            service_C_api = container "Service C API" {
                tags "Service C API"
                technology "SpringBoot"
                description "Implements Business logic for Capability C"
            }

            service_C_database = container "Service C Database Schema" {
                tags "Service C DB"
                technology "PostgreSQL"
                description "Stores data related to capabilities C"
            }

            software_system_x -> service_C_api "System X is Calling"
            service_C_api -> service_C_database "Read From and Write To"

            service_C_api -> software_system_kafka.topic_c "Publishes data to Kafka Topic C"
        }

    }

    views {
         systemContext software_system_c "Context_View_C" {
            include *
            autoLayout
        }

        container software_system_c "Container_View_C" {
            include *
            autoLayout
        }

    }

}