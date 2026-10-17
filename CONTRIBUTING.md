# Contributing

The source code and most markdown files are generated from the [markatzea][markatzea] (.mz) files.

```bash bash
set -e

# Generate the implementation doc and source
markatzea ./IMPLEMENTATION.mz > IMPLEMENTATION.md

shellcheck ./bashbot
shellcheck .config/bashbot/agent
shellcheck -e 2034 .config/bashbot/roles/*
```

[markatzea]:https://github.com/bas080/markatzea
