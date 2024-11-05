# Initial Launch
- Launch the on-premise version using docker: `docker-compose up -d`
- Install **structurizr-cli**: `brew install structurizr-cli`
- Check version of structurizr-cli: `structurizr-cli version`
```console
❯ structurizr-cli version                                                                                                                                             ─╯
structurizr-cli: 2024.11.04
structurizr-java: 3.1.0
Java: 17.0.7/Amazon.com Inc. (/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home)
OS: Mac OS X 15.1 (aarch64)
```

# Upload Big Bank Plc application workspace: 
- Open : http://localhost:8088/
- Enter username: `structurizr` and password: `password` 
- Click on create new workspace
- Go to Settings of newly created workspace
- Copy **Structurizr CLI parameters**
- e.g. `-url http://localhost:8088/api -id 1 -key 0f25505d-1ebd-4cc4-b8f3-0b0e7e592599 -secret 44d7e6ac-4872-4808-b030-d0485c813913`
- Use structurizr-cli to push to on-premise using command - (More info on various params of push commands: https://docs.structurizr.com/cli/push)
```bash
structurizr-cli push <STRUCTURIZR-CLI-PARAMETERS> -workspace <PATH-TO-WORKSPACE>
```

- for example: 
```bash
structurizr-cli push -archive false -url http://localhost:8088/api -id 1 -key 0f25505d-1ebd-4cc4-b8f3-0b0e7e592599 -secret 44d7e6ac-4872-4808-b030-d0485c813913 -workspace ./demo/big-bank-plc-example/workspace.dsl
```

- If you want to check if there are no errors in the workspace before push, then you can validate using:
```bash
structurizr-cli validate -workspace ./demo/big-bank-plc-example/workspace.dsl
```

# Stage - 1 : Basics 
### validate
```bash
structurizr-cli validate -workspace ./demo/stage-1/workspace.dsl
```

### push
```bash
structurizr-cli push -url http://localhost:8088/api -id 2 -key 354810fc-2e19-4188-baa5-2d2cce410e96 -secret d5a58637-76af-4bf9-a13c-42109af05fae -workspace ./demo/stage-1/workspace.dsl
```




