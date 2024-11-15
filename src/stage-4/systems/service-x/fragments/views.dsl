systemContext SOFTWARE_SYSTEM_X "SYSTEM_CONTEXT_X_KEY" {
    include user element.type==softwareSystem
    autoLayout lr
    description "System Context View of X"
    title "[System Context] of Software System X"
}

container SOFTWARE_SYSTEM_X "CONTAINER_VIEW_X_KEY" {
    include user element.type==container element.type==softwareSystem
    autoLayout lr
    description "Container view of Software System X."
    title "[Container] of Software System X"
}

component web_app "COMPONENT_VIEW_WEB_APP_KEY" {
    include user element.type==component element.type==container element.type==softwareSystem
    autoLayout lr
    description "Component view of Web App of System X."
    title "[Components] of Web App"
}