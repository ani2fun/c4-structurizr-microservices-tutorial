workspace {
    name "Stage - 3"
    description "Transition towards Microservices Architecture: Split into Multiple Systems"

    model {
        // DEFINE ELEMENTS
        user = person "User" "a customer interacting with the system"

        SOFTWARE_SYSTEM_X = softwareSystem "Software System X" "Provides a business capabilities A and B" {
            web_app = container "Web App" "Implements UI for A and B" "JSP/Java" {
                tags "Service"
                homepage = component "Home Page" "Home page displays A and B"
            }
        }

        SVC_A_API = softwareSystem "SVC_A_API" "Software System of A" {
            group "Service A API" {
                service_a = container "Service A" "Implements business logic for A" "SpringBoot" {
                    tags "Service"
                    controller_a = component "Controller A" "Controller which servers requests for A" {
                        url https://github.com/spring-projects/spring-petclinic/blob/main/src/main/java/org/springframework/samples/petclinic/system/WelcomeController.java
                    }
                }
                database_a = container "Database A" "Stores data for A" "PostgreSQL" {
                    tags "Database"
                    url https://www.postgresql.org/
                }
            }
        }

        SVC_B_API = softwareSystem "SVC_B_API" "Software System of B" {
            group "Service B API" {
                service_b = container "Service B" "Implements business logic for B" "SpringBoot" {
                    tags "Service"
                    controller_b = component "Controller B" "Controller which servers requests for B" {
                        url https://github.com/spring-projects/spring-petclinic/blob/main/src/main/java/org/springframework/samples/petclinic/system/CrashController.java
                    }
                }
                database_b = container "Database B" "Stores data for A" "PostgreSQL" {
                    tags "Database"
                    url https://www.postgresql.org/
                }
            }
        }

        // DEFINE RELATIONSHIPS
        # user -> container
        user -> web_app "User calls Web App to get A and B." "JSON/HTTPS"

        # container -> container
        web_app -> service_a "Web App calls service A to get A" "JSON/HTTPS"
        web_app -> service_b "Web App calls service B to get B" "JSON/HTTPS"

        service_a -> database_a "Queries from/to for dealing with A" "SQL/HTTPS"
        service_b -> database_b "Queries from/to for dealing with B" "SQL/HTTPS"

        # user -> component
        user -> homepage "User calls component homepage to get A and B."

        # component -> component
        homepage -> controller_a "Get me A"
        homepage -> controller_b "Get me B"

        # component -> container
        controller_a -> database_a "Controller queries Database .e.g SELECT * from database A"
        controller_b -> database_b "Controller queries Database .e.g SELECT * from database B"
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
            include user element.type==softwareSystem
            autoLayout lr
            description "System Context View of X"
            title "[System Context] of Software System X"
        }

        container SOFTWARE_SYSTEM_X "CONTAINER_VIEW_X_KEY" {
            include user element.type==container
            autoLayout lr
            description "Container view of Software System X."
            title "[Container] of Software System X"
        }

        component web_app "COMPONENT_VIEW_WEB_APP_KEY" {
            include user element.type==component
            autoLayout lr
            description "Component view of Web App of System X."
            title "[Components] of Web App"
        }

        image controller_a "CONTROLLER_A_KEY" {
            image assets/uml-class-diagram.png
            title "[Code] UML Class diagram"
        }

        styles {
            element "Service" {
                shape Hexagon
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

            element "Group:Service A API" {
                background red
                color #ffffff
            }

            element "Group:Service B API" {
                background blue
                color #ffffff
            }
        }
    }
}