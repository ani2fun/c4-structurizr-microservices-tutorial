systemContext software_system_a "Context_View_A" {
    include *
    autoLayout
}

container software_system_a "Container_View_A" {
    include *
    autoLayout
}

dynamic software_system_a "Context_Scope_Dynamic_View_A" {
    title "System context scope: Some dynamic view of A."
    description "Summarises how the feature works application."
    user -> service_A_api "Submits request to"
    service_A_api -> service_A_database "Read From and Write To"
    service_A_api -> software_system_kafka.topic_a "Publishes data to Kafka Topic A"
    autoLayout
}

dynamic service_A_api "Container_Scope_Dynamic_View_A" {
    autoLayout
    title "Container scope: Some dynamic view of A."
    description "Summarises how the feature works application."
    someController -> service_A_database "Controller get data using sql query."
}