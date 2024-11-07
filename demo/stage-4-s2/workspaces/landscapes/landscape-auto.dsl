workspace extends ../../shared/system-catalog.dsl {
    name "Stage - 4 - Strategy - 2 - For Enterprise - AUTO LANDSCAPE"
    description "Aggregated workspace of all systems."

    model {
        !element software_system_x {
            !include ../team-x/fragments/model.dsl
        }

        !element software_system_a {
            !include ../team-a/fragments/model.dsl
        }

        !element software_system_b {
            !include ../team-b/fragments/model.dsl
        }

        !element software_system_c {
            !include ../team-c/fragments/model.dsl
        }

        !element software_system_d {
            !include ../team-d/fragments/model.dsl
        }

        // SOME RELATIONSHIPS WHICH WERE NOT POSSIBLE AT INDIVIDUAL WORKSPACE LEVEL
        somePage -> someController "Component to Component"
        web_app -> service_A_api "System X is Calling"

    }

    views {
    }
}