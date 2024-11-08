workspace extends ../../shared/system-catalog.dsl {
    name "Stage - 4 - Strategy - 1 - For Enterprise Scalability"
    description "Aggregated workspace of all systems."

    model {
// Replace with the URL of the corresponding System Context SHARE URL

//        !element software_system_x {
//            url http://localhost:8088/share/5/diagrams#SystemContextOfX
//        }
//
        !element software_system_a {
            url http://localhost:8088/share/5/diagrams#Context_View_A
        }
//
//        !element software_system_b {
//            url http://localhost:8088/workspace/8/diagrams#SystemContextOfB
//        }
//
//        !element software_system_c {
//            url http://localhost:8088/share/9/diagrams#SystemContextOfC
//        }
//
//        !element software_system_d {
//            url http://localhost:8088/workspace/10/diagrams#SystemContextOfD
//        }
    }

    views {

        systemlandscape "EnterpriseLandscape" {
            include *
            autoLayout

            title "Enterprise Landscape View"
            description "Aggregated View of all systems."
        }

    }
}