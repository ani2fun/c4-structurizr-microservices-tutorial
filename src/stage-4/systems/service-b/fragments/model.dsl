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