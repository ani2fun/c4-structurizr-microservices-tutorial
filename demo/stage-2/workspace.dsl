workspace {
    name "Stage - 2"
    description "Transitioning into Microservices"

    model {
        // Define software systems, containers and components

        user = person "User" "a customer interacting with the system"
        software_system_x = softwaresystem "Software System X" "Provides business capabilities A, B, C" {
            web_app = container "Web App" {
                technology "Java and Spring MVC"
                description "Implements Ul and business logic for capabilities A, B, C"
            }

            database = container "Database" {
                tags "DB"
                technology "PostgreSQL"
                description "Stores data related to capabilities A, B, C"
            }
        }

        // Define Relationships
        user -> software_system_x "Calls X"
        user -> web_app "Calls X (via web app)"
        web_app -> database "Reads from and writes to"

    }

    views {
        // As soon as you write code in view you are in control of your views now and automatic views ignored.
        systemLandscape "SystemLandscape_View" {
            include *
            autoLayout lr
        }

        systemContext software_system_x "Context_View_X" {
            include *
            autoLayout lr
        }

        container software_system_x "Container_View_X" {
            include *
            autoLayout lr
        }

        styles {
            element "DB" {
                shape Cylinder
                background #1168bd
                color #ffffff
            }
        }

    }

}