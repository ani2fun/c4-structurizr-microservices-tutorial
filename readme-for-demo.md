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
structurizr-cli push -workspace ./demo/big-bank-plc-example/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

- If you want to check if there are no errors in the workspace before push, then you can validate using:
```bash
structurizr-cli validate -workspace ./demo/big-bank-plc-example/workspace.dsl
```

---

# Stage - 1 : Basics
### validate
```bash
structurizr-cli validate -workspace ./demo/stage-1/workspace.dsl
```

### push
```bash
structurizr-cli push -archive false -workspace ./demo/stage-1/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Stage - 2
### validate
```bash
structurizr-cli validate -workspace ./demo/stage-2/workspace.dsl
```

### push
```bash
structurizr-cli push -workspace ./demo/stage-2/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Stage - 3
### validate
```bash
structurizr-cli validate -workspace ./demo/stage-3/workspace.dsl
```

### push
```bash
structurizr-cli push -workspace ./demo/stage-3/workspace.dsl -archive false <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Stage - 4 - Strategy-1

- Team X -
```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/team-x/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

- Team A
```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/team-a/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```
- Team B
```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/team-b/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

- Team C
```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/team-c/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

- Team D
```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/team-d/workspace.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Team E - Enterprise Landscape - Strategy 1

```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/landscapes/landscape.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/workspaces/landscapes/landscape.dsl -url http://localhost:8088/api -id 4 -key d6e52d19-33ba-4392-ab6b-50b37d639cc4 -secret 1c5b225d-248a-49b2-9a25-9390177c7a4a
```