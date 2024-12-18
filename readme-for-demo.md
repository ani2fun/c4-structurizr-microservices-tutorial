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
- e.g. `-url http://localhost:8088/api -id 1 -key bdc6f7a8-0df1-4e5c-85a0-96c3bbe45bd1 -secret a2df3e2c-7d77-49ee-93b9-22f10bd12c60`
- Use structurizr-cli to push to on-premise using command - (More info on various params of push commands: https://docs.structurizr.com/cli/push)
```bash
structurizr-cli push -workspace <PATH-TO-WORKSPACE> <STRUCTURIZR-CLI-PARAMETERS>
```

- for example:
```bash
structurizr-cli push -workspace ./src/big-bank-plc-example/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

- If you want to check if there are no errors in the workspace before push, then you can validate using:
```bash
structurizr-cli validate -workspace ./src/big-bank-plc-example/workspace.dsl
```

---

# Stage - 1 : Basics
### validate
```bash
structurizr-cli validate -workspace ./src/stage-1/workspace.dsl
```

### push
```bash
structurizr-cli push -archive false -workspace ./src/stage-1/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Stage - 2
### validate
```bash
structurizr-cli validate -workspace ./src/stage-2/workspace.dsl
```

### push
```bash
structurizr-cli push -workspace ./src/stage-2/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Stage - 3
### push
```bash
structurizr-cli push -workspace ./src/stage-3/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Stage - 4
### Push System X:
```bash
structurizr-cli push -workspace src/stage-4/systems/service-x/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

### Push System A:
```bash
structurizr-cli push -workspace src/stage-4/systems/service-a/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

### Push System B:
```bash
structurizr-cli push -workspace src/stage-4/systems/service-b/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

### Push Landscape View:
```bash
structurizr-cli push -workspace src/stage-4/systems/landscapes/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

---