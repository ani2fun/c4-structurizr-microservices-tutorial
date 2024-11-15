workspace extends  "../../shared/system-catalog.dsl" {
    name "Stage - 4: Software System A"
    description "Split into Multiple Workspaces"

    model {
        // DEFINE ELEMENTS

        !element SVC_A_API {
            // DEFINE ELEMENTS
            service_a = container "Service A" "Implements business logic for A" "SpringBoot" {
                tags "Service"
                controller_a = component "Controller A" "Controller which servers requests for A"
            }
            database_a = container "Database A" "Stores data for A" "PostgreSQL" {
                tags "Database"
            }

            // DEFINE RELATIONSHIPS

            # container -> container
            SOFTWARE_SYSTEM_X -> service_a "Web App calls service A to get A" "JSON/HTTPS"
            service_a -> database_a "Queries from/to for dealing with A" "SQL/HTTPS"

            # component -> container
            controller_a -> database_a "Controller queries Database A"
        }
    }

    views {
        systemContext SVC_A_API "context_view_of_a" {
            include *
            autoLayout lr
            title "[System Context] of Software System A"
        }

        container SVC_A_API "container_view_of_a" {
            include *
            autoLayout lr
            title "[Container] of Software System A"
        }

        component service_a "component_view_of_a_service_a" {
            include *
            autoLayout lr
            title "[Component] of Software System A - SVC_A_API"
        }
    }
}