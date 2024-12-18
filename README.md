# Structurizr On-Premise Installation Guide

This guide covers the setup, configuration, and usage of Structurizr on-premise with Docker.

## Prerequisites

- **Docker**: Ensure Docker is installed and running on your machine.
- **Network and Port Configuration**: Ensure the intended ports (default `8088` in this guide) are available for Structurizr access.
- **Data Directory**: Prepare a directory for storing Structurizr data and configuration files.

## Table of Contents

1. [Setup Instructions](#setup)
2. [Configuration Files](#config-files)
3. [Running Structurizr with Docker Compose](#docker-compose)
4. [Creating and Managing Workspaces](#workspaces)
5. [Using the Structurizr CLI](#cli)
6. [Exporting Workspaces](#exporting)
7. [Validating and Pushing Workspaces](#validate-push)
8. [Optional: Building from Source Code](#build-source)

---

## <a name="setup"></a>Setup Instructions

1. **Using Docker Compose**:
   ```bash
   docker-compose up -d
   ```

2. **Access Structurizr**:
   Visit [http://localhost:8088](http://localhost:8088) in your browser. Use the following default credentials:
   - **Username**: `structurizr`
   - **Password**: `password`

---

## <a name="config-files"></a>Configuration Files

### `structurizr.properties`

- Located in `./structurizr-data-store/structurizr.properties`.
- This file contains configuration for Structurizr, including API keys and other security settings.
- For example:
  ```console
  structurizr.url=http://localhost:8088
  structurizr.apiKey=$2a$10$t3U.QeK.ZuELsjd9fRaw7OZX8j51j.64OJyvbufQLpPCKzCLd4Hgq
  ```
- To generate a hashed API_KEY for Structurizr, visit:
    - ```http
      http://localhost:8088/bcrypt/{API_KEY}
      ```
    - Replace `{API_KEY}` with your desired KEY.

### `structurizr.users`

- Located in `./structurizr-data-store/structurizr.users`.
- Defines user credentials and hashed passwords for accessing Structurizr.
- To generate a hashed password for Structurizr, visit:
    - ```http
      http://localhost:8088/bcrypt/{YOUR_PASSWORD}
      ```
    - Replace `{YOUR_PASSWORD}` with your desired password.

---

## <a name="docker-compose"></a>Running Structurizr with Docker Compose

Create a `docker-compose.yaml` file with the following content to simplify and control the deployment:

```yaml
version: '3.8'

services:
  structurizr:
    image: structurizr/onpremises
    container_name: structurizr-onpremise
    ports:
      - "8088:8080"  # Expose the Structurizr port on 8088
    volumes:
      - ./structurizr-data-store:/usr/local/structurizr  # Mount the data directory
    environment:
      - STRUCTURIZR_PROPERTIES_FILE=/usr/local/structurizr/structurizr.properties
```

Run Structurizr:
```bash
docker-compose up -d
```

Content of  `structurizr-data-store` directory:
```console
❯ tree -L 1                                                                                                                                                           ─╯
.
├── structurizr.properties
└── structurizr.users
```

---

## <a name="workspaces"></a>Creating and Managing Workspaces

### Create a New Workspace

- **Via Web UI**: Log in to Structurizr at [http://localhost:8088](http://localhost:8088) and click "New Workspace."
- **Via API**:
- ```bash
  curl -X POST -H "X-Authorization: YOUR_API_KEY" http://localhost:8088/api/workspace
  ```

### Retrieve All Workspaces

- ```bash
  curl -X GET -H "X-Authorization: YOUR_API_KEY" http://localhost:8088/api/workspace
  ```
- Example output:
    ```json
    {"workspaces":[{"id":1,"name":"Workspace 0001","description":"Description","apiKey":"API_KEY","apiSecret":"API_SECRET","privateUrl":"http://localhost:8088/workspace/1","publicUrl":"http://localhost:8088/share/1","shareableUrl":""}]}
    ```

---

## <a name="cli"></a>Using the Structurizr CLI

The [Structurizr CLI](https://docs.structurizr.com/cli/installation) is helpful for automation, validation, and workspace management.

### Install Structurizr CLI

On MacOS:
```bash
brew install structurizr-cli
```

### Obtain API Key and Other Structurizr CLI parameters for a workspace:

- Go to Workspace Settings: e.g.[Worksapce Settings](http://localhost:8088/workspace/1/settings)
- Copy **Structurizr CLI parameters**
  - for example: `-url http://localhost:8088/api -id 1 -key 71b9ed19-3b95-41e2-845d-54b7dda3618d -secret 8c43d9cc-b551-4bb6-95e7-2f172baef35f`

### Push to a Workspace

```bash
structurizr-cli push -url http://localhost:8088/api -id WORKSPACE_ID -key YOUR_API_KEY -secret YOUR_API_SECRET -workspace path/to/workspace.dsl
```

Example:
```bash
structurizr-cli push -workspace src/stage-1/workspace.dsl -url http://localhost:8088/api -id 1 -key 13a548a6-9254-43b4-a79b-95dd6e23bde9 -secret cbd67d02-08e1-4557-8bc9-539aefb840a6
structurizr-cli push -workspace src/stage-1/workspace.dsl -archive false <PARAMS>
```

## <a name="exporting"></a>Exporting Workspaces

Export a workspace to various formats using Structurizr CLI:

```bash
structurizr-cli export -workspace path/to/workspace.dsl -format <format> -output path/to/output/folder
```

Replace `<format>` with one of `json`, `plantuml`, `mermaid`, or `ilograph` and specify the desired output directory.

---

### Export Formats and Examples

1. **JSON Export**:
   ```bash
   structurizr-cli export -workspace path/to/workspace.dsl -format json -output path/to/output/json
   ```

2. **PlantUML Export**:
   ```bash
   structurizr-cli export -workspace path/to/workspace.dsl -format plantuml -output path/to/output/plantuml
   ```

3. **Mermaid Export**:
   ```bash
   structurizr-cli export -workspace path/to/workspace.dsl -format mermaid -output path/to/output/mermaid
   ```

4. **Ilograph Export**:
   ```bash
   structurizr-cli export -workspace path/to/workspace.dsl -format ilograph -output path/to/output/ilograph
   ```

## <a name="validate-push"></a>Validating and Pushing Workspaces

### General Push Format

```bash
structurizr-cli validate -workspace path/to/workspace.dsl
structurizr-cli push -url http://localhost:8088/api -id WORKSPACE_ID -key API_KEY -secret API_SECRET -workspace path/to/workspace.dsl
```



---

# If you'd like to build Structurizr on-premise from the source, follow these steps:
### <a name="build-source"></a>Optional: Building from Source Code

### Step 1: Clone the Source Repositories

Clone both the on-premise server and the UI repositories:

```bash
git clone https://github.com/structurizr/onpremises.git structurizr-onpremises
git clone https://github.com/structurizr/ui.git structurizr-ui
```

### Step 2: Build the UI and Server

1. **Navigate to the `structurizr-onpremises` directory**:
   ```bash
   cd structurizr-onpremises
   ```

2. **Build the UI**: This command will pull the latest UI files into the server:
   ```bash
   ./ui.sh
   ```

3. **Build the Application**:
   - Use Gradle to build the application, skipping integration tests if necessary:
     ```bash
     ./gradlew clean build -x integrationTest
     ```

   - If the build succeeds, you should see a file named `structurizr-onpremises.war` in the `structurizr-onpremises/build/libs` directory.

### Step 3: Create a Docker Image

To containerize your custom build, follow these steps:

1. **Navigate to the `structurizr-onpremises` directory** (if not already there):
   ```bash
   cd structurizr-onpremises
   ```

2. **Build the Docker Image**:
   ```bash
   docker build . -t structurizr-onpremise-local
   ```

### Step 4: Run the Docker Container

Start a Docker container using the custom-built image. Replace `/path/to/dataDirectory` with the actual path to your data directory:

```bash
docker run -it --rm -p 8080:8080 -v /path/to/dataDirectory:/usr/local/structurizr structurizr-onpremise-local
```

- This command runs the Structurizr on-premise application on port `8080`.
- You can access it by visiting [http://localhost:8080](http://localhost:8080) in your browser.

By building from source, you can customize Structurizr as needed or include it in your CI/CD pipeline for automated deployment. Make sure to test your build and verify configurations for production use.