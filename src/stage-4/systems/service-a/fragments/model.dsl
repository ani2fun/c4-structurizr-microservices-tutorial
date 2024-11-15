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