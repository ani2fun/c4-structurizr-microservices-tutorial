workspace {
    name "Stage - 3"
    description "Transitioning into Microservices with Splitting into Several teams"

    model {
        // Define software systems, containers and components

        user = person "User" "a customer interacting with the system"

        software_system_x = softwaresystem "Software System X" "Provides business capabilities A, B, C and D" {
            web_app = container "Web App" {
                tags "Web App"
                technology "Java and Spring MVC"
                description "Implements Ul and business logic for capabilities A, B, C and D"
            }
        }

        software_system_a = softwaresystem "Software System A" "Provides business capabilities A" {
            tags "Software System A"

            service_A_api = container "Service A API" {
                tags "Service A API"
                technology "SpringBoot"
                description "Implements Business logic for Capability A"
            }

            service_A_database = container "Service A Database Schema" {
                tags "Service A DB"
                technology "PostgreSQL"
                description "Stores data related to capabilities A"
            }
        }

        software_system_b = softwaresystem "Software System B" "Provides business capabilities B" {
            tags "Software System B"
            service_B_api = container "Service B API" {
                tags "Service B API"
                technology "SpringBoot"
                description "Implements Business logic for Capability B"
            }

            service_B_database = container "Service B Database Schema" {
                tags "Service B DB"
                technology "PostgreSQL"
                description "Stores data related to capabilities B"
            }
        }

        software_system_c = softwaresystem "Software System C" "Provides business capabilities C" {
            tags "Software System C"
            service_C_api = container "Service C API" {
                tags "Service C API"
                technology "SpringBoot"
                description "Implements Business logic for Capability C"
            }

            service_C_database = container "Service C Database Schema" {
                tags "Service C DB"
                technology "PostgreSQL"
                description "Stores data related to capabilities C"
            }
        }

        software_system_d = softwaresystem "Software System D" "Provides business capabilities D" {
            tags "Software System D"
            service_D_api = container "Service D API" {
                tags "Service D API"
                technology "SpringBoot"
                description "Implements Business logic for Capability D"
            }
        }


        // Define Relationships
        user -> software_system_x "Calls X"
        user -> web_app "Calls X (via Web app) to do A,B and C"

        web_app -> service_A_api "Does A Using" "JSON/HTTPS"
        service_A_api -> service_A_database "Read From and Write To"

        web_app -> service_B_api "Does B Using" "JSON/HTTPS"
        service_B_api -> service_B_database "Read From and Write To"

        web_app -> service_C_api "Does C Using" "JSON/HTTPS"
        service_C_api -> service_C_database "Read From and Write To"

        web_app -> service_D_api "Does D Using" "JSON/HTTPS"

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

        systemContext software_system_a "Context_View_A" {
            include *
            autoLayout lr
        }

        container software_system_a "Container_View_A" {
            include *
            autoLayout lr
        }

        systemContext software_system_b "Context_View_B" {
            include *
            autoLayout lr
        }

        container software_system_b "Container_View_B" {
            include *
            autoLayout lr
        }

        systemContext software_system_c "Context_View_C" {
            include *
            autoLayout lr
        }

        container software_system_c "Container_View_C" {
            include *
            autoLayout lr
        }

        systemContext software_system_d "Context_View_D" {
            include *
            autoLayout lr
        }

        container software_system_d "Container_View_D" {
            include *
            autoLayout lr
        }

        styles {
            element "Person" {
                shape Person
                background #1168bd
                color #ffffff
            }

            element "Web App" {
                shape RoundedBox
                background #3a7885
                color #ffffff
            }

            element "Service A API" {
                shape Hexagon
                background #1168bd
                color #ffffff
            }
            element "Service A DB" {
                shape Cylinder
                background #1168bd
                color #ffffff
            }

            element "Service B API" {
                shape Hexagon
                background #90EE90
                color #ffffff
            }

            element "Service B DB" {
                shape Cylinder
                background #90EE90
                color #ffffff
            }

            element "Service C API" {
                shape Hexagon
                background #ff1a40
                color #ffffff
            }
            element "Service C DB" {
                shape Cylinder
                background #ff1a40
                color #ffffff
            }

            element "Service D API" {
                shape Hexagon
                background orange
                color white
            }

            element "Group:Service A" {
                color #1168bd
            }
            element "Group:Service B" {
                color #90EE90
            }
            element "Group:Service C" {
                color #ff1a40
            }

            element "Group:Service D" {
                color orange
            }

            element "Software System A" {
                background #1168bd
                color white
            }

            element "Software System B" {
                background #90EE90
                color white
            }
            element "Software System C" {
                background #ff1a40
                color white
            }
            element "Software System D" {
                background orange
                color white
            }
        }

    }

}