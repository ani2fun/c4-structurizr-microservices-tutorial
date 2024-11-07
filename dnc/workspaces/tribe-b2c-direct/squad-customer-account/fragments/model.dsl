// Elements
service_A_api = container "Service A API" {
    technology "SpringBoot"
    description "Implements Business logic for Capability A"
    someController = component "Some Controller" "Allows users to send request to System A." "SpringBoot Rest Controller"
}

service_A_database = container "Service A Database Schema" {
    tags "Database"
    technology "PostgreSQL"
    description "Stores data related to capabilities A"
}

// Relationships
user -> service_A_api "User calling Service A API directly, skipping Web App"

software_system_x -> service_A_api "System X is Calling"

someController -> service_A_database "Controller queries data via sql query."
service_A_api -> service_A_database "Read From and Write To"
service_A_api -> software_system_kafka.topic_a "Publishes data to Kafka Topic A"