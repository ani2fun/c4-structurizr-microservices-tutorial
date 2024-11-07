// Elements
service_D_api = container "Service D API" {
    tags "Database"
    technology "AWS Lambda"
    description "Implements Business logic for Capability D using AWS Lambda"
}

// Relationships
software_system_x -> service_D_api "System X is Calling"