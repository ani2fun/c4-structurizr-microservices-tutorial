// Elements
web_app = container "Web App" {
    technology "Java and Spring MVC"
    description "Implements UI and business logic for capabilities A, B, C and D"
    somePage = component "Some Page" "Allows users to View this page." "Spring MVC Some Page."
}


// Relationships
user -> web_app "Calls X (via Web app) to do A,B and C"
user -> somePage "User calls somePage."
web_app -> software_system_a "Calling A Using JSON/HTTPS" "service-A-api"
somePage -> software_system_a "Some page of web app interacts with System A via" "service-A-api"