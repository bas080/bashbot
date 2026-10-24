# BashBot

[![Stand with Palestine](https://img.shields.io/badge/🇵🇸%20%20Stand%20With%20Palestine-007A3D?style=flat-square&color=brightgreen)](https://www.islamic-relief.org.uk/giving/appeals/palestine/)
[![Donate via Liberapay](https://img.shields.io/badge/Donate-Liberapay-F6C915?style=flat-square&logo=liberapay&logoColor=black)](https://liberapay.com/bas080)

> Bish Bash Bot - setup complete agentic workflows easily.

A flexible framework for creating agent-based workflows using bash pipes and specialized LLM-powered roles.

## Installation

Run the installation script:

```bash
curl -fsSL https://raw.githubusercontent.com/bas080/bashbot/master/install.sh | bash
```

The install script will ask you if you want to setup using bashbot roles and agent. You can decide to do your own thing if you want
or use the tool with the roles and agent it ships with.

After installation, run `bashbot` to open an interactive repl with the roles defined as functions.


## Examples

> These examples are based on the roles defined in this repository. You can and should write your own roles
> or have your bot write them for you.

```bash
# A simple pipeline dev pipeline
cat ticket.md | code | verify

# Make it of any length and have output of several join into one.
{
  cat ticket.md | plan;
  cat ticket.md | ux;
  cat ticket.md | ui;
} | code | verify | audit | code | review # | ...

# Define the loop with normal bash.
develop() {
  plan | code | review || develop
}; develop # Run the loop

# Combine feedback loops in tee pipelines and run in parallel/
plan | tee >(develop) >(document | review)

# Combine the tools you know into the pipeline.
develop | run shellcheck script.sh | review

# Conditionally add the output of a tool or agent
develop | tee >(test -f ./my-file.sh && shellcheck) | review
develop | tee >(test -f ./design-document.md && ux) | review
```

## Environment Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `BASHBOT_DEBUG` | When set to any non-empty value, enables shell tracing (`set -x`) in `bashbot` | Unset | No |
| `BASHBOT_SESSION_FILEPATH_TEMPLATE` | Template for session file paths. `$BASHBOT_SESSION_NAME` is substituted at runtime. | `$HOME/.config/bashbot/session/${BASHBOT_SESSION_NAME:-$RANDOM}` | No |
| `BASHBOT_SESSION_FILEPATH` | Resolved session file path (derived from template). | — | No |
| `BASHBOT_COLLECTION_FILEPATH_TEMPLATE` | Template for collection file paths. `$BASHBOT_COLLECTION_NAME` is substituted at runtime. | `$HOME/.config/bashbot/collection/${BASHBOT_COLLECTION_NAME:-$RANDOM}` | No |
| `BASHBOT_COLLECTION_FILEPATH` | Resolved collection file path (derived from template). | — | No |
| `BASHBOT_ROLES_PATH` | Base path for role files. | `$HOME/.config/bashbot/roles` | No |
| `BASHBOT_AGENT_FILEPATH` | Path to the agent executable. | `$HOME/.config/bashbot/agent` | No |
| `BASHBOT_PS1` | Custom prompt string for interactive shell (prepends to existing PS1). | `🤖 ` | No |
| `BASHBOT_MAX_RETRIES` | Maximum retry attempts for divert/goto loops. | `10` | No |

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

This license is a copyleft license that ensures the software remains free and
open for all users. Corporations distributing modified versions must also
release their source code under the same license.
