workspace {
    name "Stage - 1"
    description "Representing C4 Model using Structurizr DSL"

    model {
        // DEFINE ELEMENTS
        user = person "User" "a user is interacting with our system"

        SOFTWARE_SYSTEM_X = softwareSystem "Software System X" "Provides a business funtionality A and B" {
            !docs documentation
            web_app = container "Web App" "Implements UI and business logic for A and B" "Java and Spring MVC" {
                tags "Web App"
                homepage = component "Home Page" "Home page displays A and B"
                controller_x = component "Controller X" "Controller which servers requests for A and B"
            }
            database_x = container "Database of X" "Stores data for A and B" "PostgreSQL" {
                tags "Database"
            }
        }
        // DEFINE RELATIONSHIPS
        # DRY Principle. https://docs.structurizr.com/dsl/tutorial#3-implied-relationships
        # You can omit following relationship "user -> SOFTWARE_SYSTEM_X", as it is already take care of using "user -> web_app".
        # user -> SOFTWARE_SYSTEM_X "User calls System X to get A and B." "JSON/HTTPS"
        user -> web_app "User calls to get A and B" "Java and Spring MVC"
        web_app -> database_x "Stores data for A and B" "PostgreSQL"
        user -> homepage "User calls component homepage to get A and B."
        homepage -> controller_x "Get me A and B"
        controller_x -> database_x "Controller queries Database .e.g SELECT * from database X"
    }

    views {
        // DEFINE VIEWS
        // Once you start writing custom Views code, automatic views are ignored.

        systemLandscape SOFTWARE_SYSTEM_LANDSCAPE_KEY {
            include *
            autoLayout lr
            description "My System Landscape View."
            title "[System Landscape] of Software System X"
        }

        systemContext SOFTWARE_SYSTEM_X "SYSTEM_CONTEXT_X_KEY" {
            include *
            autoLayout lr
            description "System Context View of X"
            title "[System Context] of Software System X"
        }

        container SOFTWARE_SYSTEM_X "CONTAINER_VIEW_X_KEY" {
            include *
            autoLayout lr
            description "Container view of Software System X."
            title "[Container] of Software System X"
        }

        component web_app "COMPONENT_VIEW_WEB_APP_KEY" {
            include *
            autoLayout lr
            description "Component view of Web App of System X."
            title "[Components] of Web App"
        }

        image controller_x "CONTROLLER_X_KEY" {
            image assets/uml-class-diagram.png
            title "[Code] UML Class diagram"
        }

        styles {
            element "Web App" {
                shape RoundedBox
                background #3a7885
                color #ffffff
            }
            element "Database" {
                shape Cylinder
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape Person
                background #1168bd
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Component" {
                shape RoundedBox
                background #B57EDC
                color #ffffff
            }
        }
    }
}