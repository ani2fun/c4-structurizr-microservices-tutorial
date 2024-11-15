systemContext SVC_A_API "context_view_of_a" {
    include *
    autoLayout lr
    title "[System Context] of Software System A"
}

container SVC_A_API "container_view_of_a" {
    include *
    autoLayout lr
    title "[Container] of Software System A"
}

component service_a "component_view_of_a_service_a" {
    include *
    autoLayout lr
    title "[Component] of Software System A - SVC_A_API"
}