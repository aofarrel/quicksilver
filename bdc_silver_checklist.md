While this repo is focused on general good practices, you may also find it useful if you are seeking silver compliance with BioData Catalyst.

| Thing                 | Details                                                                                            |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Containers                 | A versioned container created from an official image with no critical vulnerabilities                                                                                            |
| Container Signing          | No container signing required                                                                                                                                                    |
| Container Hosting          | DockerHub, Quay.io, Google Container Registry, AWS ECR                                                                                                                           |
| Container Referencing      | Containers are referenced within workflow by digest format only (not parameterized, untagged, versioned, etc.)                                                                   |
| Publication                | DOI minted snapshot using Zenodo integration with Dockstore                                                                                                                      |
| Code Signing               | No code signing                                                                                                                                                                  |
| Version Control            | Public source code on a version control repository                                                                                                                               |
| Dockerfile                 | Publicly available Dockerfile hosted on version control repository with source code                                                                                              |
| Sample Data                | Open access test data available that is not within the container                                                                                                                 |
| Checker Workflow           | Checker workflow published in Dockstore that uses open access sample data required above                                                                                         |
| Descriptor file metadata   | Contains authorship and description of the tool or workflow (required for faceted search)                                                                                        |
| README                     | High quality markdown hosted on a version control repository with sections that cover 1) about, 2) authors, 3) usage, 4) references, 5) (optional) any available cloud cost data |
| Verified Cloud Environment | Launch With BioData Catalyst (Terra or SevenBridges)                                                                                                                             |
