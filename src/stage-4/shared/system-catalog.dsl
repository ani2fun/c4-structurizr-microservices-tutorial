workspace {
    name "Stage - 4"
    description "SYSTEM CATALOG: Transition towards Microservices Architecture: Split into Multiple Systems"

    model {
        // DEFINE COMMON SOFTWARE SYSTEMS, CONTAINERS and COMPONENTS
        !include users.dsl

        SOFTWARE_SYSTEM_X = softwareSystem "Software System X" "Provides a business capabilities A and B"

        SVC_A_API = softwareSystem "SVC_A_API" "Software System of A"

        SVC_B_API = softwareSystem "SVC_B_API" "Software System of B"

    }

    views {
        // JUST ADD STYLES IN HERE FOR BETTER VISUAL APPEARANCE FOR OUR ELEMENTS
        !include styles.dsl

    }
}