workspace extends "../../shared/system-catalog.dsl" {
    name "Stage - 4: Software System B"
    description "Split into Multiple Workspaces"

    model {
        // DEFINE ELEMENTS

        !element SVC_B_API {
            // DEFINE ELEMENTS
            service_b = container "Service B" "Implements business logic for B" "SpringBoot" {
                tags "Service"
                controller_b = component "Controller B" "Controller which servers requests for B"
            }
            database_b = container "Database B" "Stores data for B" "PostgreSQL" {
                tags "Database"
            }

            // DEFINE RELATIONSHIPS
            # container -> container
            SOFTWARE_SYSTEM_X -> service_b "Web App calls service B to get B" "JSON/HTTPS"
            service_b -> database_b "Queries from/to for dealing with B" "SQL/HTTPS"

            # component -> container
            controller_b -> database_b "Controller queries Database B"
        }
    }

    views {
        systemContext SVC_B_API "context_view_of_b" {
            include *
            autoLayout lr
            title "[System Context] of Software System B"
        }

        container SVC_B_API "container_view_of_b" {
            include *
            autoLayout lr
            title "[Container] of Software System B"
        }

        component service_b "component_view_of_b_service_b" {
            include *
            autoLayout lr
            title "[Component] of Software System B - SVC_B_API"
        }
    }
}