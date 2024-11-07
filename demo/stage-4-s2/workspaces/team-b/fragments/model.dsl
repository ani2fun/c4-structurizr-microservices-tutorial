// Elements
service_B_api = container "Service B API" {
    technology "SpringBoot"
    description "Implements Business logic for Capability B"
}

service_B_database = container "Service B Database Schema" {
    tags "Database"
    technology "PostgreSQL"
    description "Stores data related to capabilities B"
}

// Relationships
software_system_x -> service_B_api "System X is Calling"
service_B_api -> service_B_database "Read From and Write To"

service_B_api -> software_system_kafka.topic_b "Publishes data to Kafka Topic B"