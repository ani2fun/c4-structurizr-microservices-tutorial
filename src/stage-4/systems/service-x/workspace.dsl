workspace extends "../../shared/system-catalog.dsl" {
    name "Stage - 4: Software System X"
    description "Split into Multiple Workspaces"

    model {
        // DEFINE ELEMENTS
        !element SOFTWARE_SYSTEM_X {

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
        }
    }

    views {
        systemContext SOFTWARE_SYSTEM_X "SYSTEM_CONTEXT_X_KEY" {
            include user element.type==softwareSystem
            autoLayout lr
            description "System Context View of X"
            title "[System Context] of Software System X"
        }

        container SOFTWARE_SYSTEM_X "CONTAINER_VIEW_X_KEY" {
            include user element.type==container element.type==softwareSystem
            autoLayout lr
            description "Container view of Software System X."
            title "[Container] of Software System X"
        }

        component web_app "COMPONENT_VIEW_WEB_APP_KEY" {
            include user element.type==component element.type==container element.type==softwareSystem
            autoLayout lr
            description "Component view of Web App of System X."
            title "[Components] of Web App"
        }
    }
}