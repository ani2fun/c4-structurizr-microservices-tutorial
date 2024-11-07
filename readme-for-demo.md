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
structurizr-cli push -archive false -workspace ./demo/stage-4-s1/landscapes/landscape.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

---

# Team E - Enterprise Landscape - Strategy 2

```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s2/workspaces/landscapes/landscape.dsl <STRUCTURIZR-CLI-PARAMETERS>
```

```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s2/workspaces/landscapes/landscape.dsl -url http://localhost:8088/api -id 2 -key a8046b1c-a709-475a-82a7-c27853bfd3d5 -secret fc10be0b-caf2-4335-be3f-f4b82d73003d
```

AUTO:
```bash
structurizr-cli push -archive false -workspace ./demo/stage-4-s2/workspaces/landscapes/landscape-auto.dsl -url http://localhost:8088/api -id 3 -key 059e209d-806a-4e50-971e-3b27ec89cf0b -secret d721f28b-7c55-469d-84d5-6e690126ffc8
```
