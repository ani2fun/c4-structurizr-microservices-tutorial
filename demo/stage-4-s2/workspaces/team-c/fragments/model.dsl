// Elements
service_C_api = container "Service C API" {
    tags "Service C API"
    technology "SpringBoot"
    description "Implements Business logic for Capability C"
}

service_C_database = container "Service C Database Schema" {
    tags "Database"
    technology "PostgreSQL"
    description "Stores data related to capabilities C"
}

// Relationships
software_system_x -> service_C_api "System X is Calling"
service_C_api -> service_C_database "Read From and Write To"
service_C_api -> software_system_kafka.topic_c "Publishes data to Kafka Topic C"