# Pipeline Design

1. **Triggers:** Push to `main` (excluding docs/markdown), Pull Requests targeting `main`, manual dispatch (`workflow_dispatch`), and a weekly schedule (Mondays at 07:00 UTC).
2. **Jobs Graph:** 
   - `test` runs first.
   - `package` runs after `test` succeeds (can be skipped conditionally).
   - `verify` runs after `package`.
   - `report` runs after `test` and `package` **always** (regardless of success or failure).
3. **Artifact:** A tarball package (`dist/temperature-<version>.tar.gz`) containing the application code and README.
4. **Pipeline Type:** This is a **Continuous Integration (CI)** pipeline because it automates testing, packaging verification, and reporting without deploying to production environments.
5. **Failure Handling:** When tests fail, the `package` job should be skipped because we never want to package broken or unverified code.
