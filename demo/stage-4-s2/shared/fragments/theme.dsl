!include ./constants.dsl

styles {
    # Common Standard Users styles

    element "User" {
        shape Person
        background "${LIGHT_BLUE}"
        color white
        stroke white
    }

    element "Admin User" {
        shape Person
        background "${GOLD}"
        color black
        stroke white
    }

    # Common Software Systems styles
    element "Software System" {
        background "${LIGHT_BLUE}"
        color white
    }

    element "Container" {
        shape Hexagon
        background "${ORANGE_WEB}"
        color black
    }

    # Common Container styles
    element "Kafka Topic" {
        shape Pipe
        background "${FRENCH_GRAY}"
        color black
    }

    element "Database" {
        shape Cylinder
        background "${FRENCH_GRAY}"
        color white
        stroke white
    }

    element "SQL Database" {
        shape Cylinder
        background "${FRENCH_GRAY}"
        color white
        stroke white
    }

}