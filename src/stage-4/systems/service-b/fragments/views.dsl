systemContext SVC_B_API "context_view_of_b" {
    include *
    autoLayout lr
    title "[System Context] of Software System B"
}

container SVC_B_API "container_view_of_b" {
    include *
    autoLayout lr
    title "[Container] of Software System B"
}

component service_b "component_view_of_b_service_b" {
    include *
    autoLayout lr
    title "[Component] of Software System B - SVC_B_API"
}