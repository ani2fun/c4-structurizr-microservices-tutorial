# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../shared/system-catalog.dsl {

    name "Stage - 4 - Strategy 2 - For Enterprise - Team X's - Software System."
    description "UI and some business Logic. Independently handles by Team X. Deals with implementing business capability A, B, C and D - Using Extensions of a common Model."

    model {
        !element software_system_x {
            !include ./fragments/model.dsl
        }
    }

    views {
        !include ./fragments/views.dsl
        !include ../../shared/fragments/common-views.dsl
    }

}