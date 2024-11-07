# Relative Path OR you can specify path uploaded on premise Workspace.
# KEYWORD IS "extends" to extend the workspace
workspace extends ../../shared/system-catalog.dsl {

    name "Stage - 4 - Strategy 2 - For Enterprise - Team B's - Software System."
    description "The software architecture of Team B which deals with some complex systems implementing business capability B - Using Extensions of a common Model. Independently Developed."

    model {
        !element software_system_b {
            !include ./fragments/model.dsl
        }
    }

    views {
        !include ./fragments/views.dsl
        !include ../../shared/fragments/common-views.dsl
    }

}