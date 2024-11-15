workspace extends "../../shared/system-catalog.dsl" {
    name "Stage - 4: Landscape View -  Aggregating System A and System B"
    description "Transition towards Microservices Architecture: Split into Multiple Systems"

    model {

        !element SOFTWARE_SYSTEM_X {
            !include ../service-x/fragments/model.dsl
        }

        !element SVC_A_API {
            !include ../service-a/fragments/model.dsl
        }

        !element SVC_B_API {
            !include ../service-b/fragments/model.dsl
        }

        // DEFINE RELATIONSHIPS
        # container -> container
        web_app -> service_a "Web App calls service A to get A" "JSON/HTTPS"
        web_app -> service_b "Web App calls service B to get B" "JSON/HTTPS"

        # component -> component
        homepage -> controller_a "Get me A"
        homepage -> controller_b "Get me B"
    }

    views {
        // Once you write custom view code, manual control overrides automatic views.
        systemLandscape SOFTWARE_SYSTEM_X {
            include *
            autoLayout lr
            title "[System Landscape] of Software System X"
        }

        systemContext SOFTWARE_SYSTEM_X "SYSTEM_CONTEXT_X_KEY" {
            include *
            autoLayout lr
            title "[System Context] of Software System X"
        }

        container SOFTWARE_SYSTEM_X "CONTAINER_VIEW_X_KEY" {
            include element.type==person element.type==container element.type==softwareSystem
            autoLayout lr
            title "[Container] of Software System X"
        }

        component web_app "COMPONENT_VIEW_WEB_APP_KEY" {
            include element.type==person element.type==component element.type==container element.type==softwareSystem
            autoLayout lr
            title "[Component] of Software System X"
        }
    }
}