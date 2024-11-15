web_app = container "Web App" "Implements UI for A and B" "JSP/Java" {
    tags "Service"
    homepage = component "Home Page" "Home page displays A and B"
}

// DEFINE RELATIONSHIPS
# user -> software system

# user -> container
user -> web_app "User calls Web App to get A and B." "JSON/HTTPS"

# container -> other software systems
web_app -> SVC_A_API "Web App calls System A" "API A"
web_app -> SVC_B_API "Web App calls System A" "API B"

# user -> component
user -> homepage "User calls component homepage to get A and B."

# component -> software systems
homepage -> SVC_A_API
homepage -> SVC_B_API