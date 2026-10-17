# Document how to include bash tools in pipeline

```bash

code | tee >(shellcheck myfile.sh 2>&1 || true) | review

```
