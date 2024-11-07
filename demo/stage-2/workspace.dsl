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

            group "Service A" {
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

            group "Service B" {
                service_B_api = container "Service B API" {
                    tags "Service B API"
                    technology "SpringBoot"
                    description "Implements Business logic for Capability B"
                }

                service_B_database = container "Service B Database Schema" {
                    tags "Service A DB"
                    technology "PostgreSQL"
                    description "Stores data related to capabilities B"
                }
            }

            group "Service C" {
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

            group "Service D" {
                service_D_api = container "Service D API" {
                    tags "Service D API"
                    technology "AWS Lambda"
                    description "Implements Business logic for Capability D"
                }

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

        styles {
            element "Person" {
                shape Person
                background #1168bd
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
        }

    }

}