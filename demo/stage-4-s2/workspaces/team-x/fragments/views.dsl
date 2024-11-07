systemContext software_system_x "Context_View_X" {
    include *
    autoLayout
}

container software_system_x "Container_View_X" {
    include *
    autoLayout
}

dynamic web_app "Container_Scope_Dynamic_View_X" {
    autoLayout
    title "Container scope: Some dynamic view of X."
    description "Summarises how the feature works application."
    somePage -> software_system_a "Some page Sends data to System A"
}