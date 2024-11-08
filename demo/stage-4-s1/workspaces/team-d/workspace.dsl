# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../shared/system-catalog.dsl {

    name "Stage - 4 - Strategy - 1 - For Enterprise Scalability - Team D's - Software System."
    description "The software architecture of Team D which deals with some complex systems implementing business capability D - Using Extensions of a common Model. Independently Developed."


    model {
        !element software_system_d {
            service_D_api = container "Service D API" {
                tags "Service D API"
                technology "AWS Lambda"
                description "Implements Business logic for Capability D using AWS Lambda"
            }

            software_system_x -> service_D_api "System X is Calling"
        }


    }


    views {

         systemContext software_system_d "Context_View_D" {
            include *
            autoLayout
        }

        container software_system_d "Container_View_D" {
            include *
            autoLayout
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