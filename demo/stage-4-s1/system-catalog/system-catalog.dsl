workspace {
    name "Stage - 4 - System Catalog"
    description "Microservices System Catalog for common model consists of Only - Software Systems, Users and relationships between them."

    !identifiers hierarchical

    model {
        # Add people/users interacting with the systems
        !include ./components/users.dsl

        # Add various software systems
        # https://docs.structurizr.com/dsl/language#softwaresystem
        # softwareSystem <name> [description] [tags] {...}
        software_system_x = softwaresystem "Software System X" "Provides business capabilities A, B, C and D"
        software_system_a = softwaresystem "Software System A" "Provides business capability A"
        software_system_b = softwaresystem "Software System B" "Provides business capability B"
        software_system_c = softwaresystem "Software System C" "Provides business capabilities C"
        software_system_d = softwaresystem "Software System D" "Provides business capabilities D using AWS Lambda"
        software_system_kafka = softwaresystem "Software System Kafka" "Description - Software System Kafka" {
            !include ./components/kafka-topics.dsl
        }

        # Define Relationships between USER(People) and Software Systems only.

        # User -> User
        user -> admin_user "Dealing with external people."

        # User -> Software System
        user -> software_system_x "Calls X"

        # Software System -> User

        # Software System -> Software System
        software_system_x -> software_system_a "Calls A"
        software_system_x -> software_system_b "Calls B"
        software_system_x -> software_system_c "Calls C"
        software_system_x -> software_system_d "Calls D"


        software_system_a -> software_system_kafka "Topic A"
        software_system_b -> software_system_kafka "Topic B"
        software_system_c -> software_system_kafka "Topic C"
    }


    views {
        !include ./fragments/theme.dsl

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