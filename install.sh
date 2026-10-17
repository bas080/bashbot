#!/usr/bin/env bash
# BashBot installation script
# Run this script to set up BashBot on your system.

set -euo pipefail

echo "Installing BashBot..."

# Install bashbot binary to .local/bin
if [ ! -f "$HOME/.local/bin/bashbot" ]; then
  echo "Downloading and installing bashbot..."
  curl -sL https://raw.githubusercontent.com/bas080/bashbot/master/bashbot > "$HOME/.local/bin/bashbot"
  chmod +x "$HOME/.local/bin/bashbot"
fi

# Create config directory
mkdir -p ~/.config/bashbot

# Install agents config provided in the repo
echo "Installing agents configuration..."
curl -sL https://raw.githubusercontent.com/bas080/bashbot/master/roles.sh > ~/.config/bashbot/agents.sh

# Setup instructions
echo ""
echo "Setup complete! Next steps:"
echo ""
echo "1. Define roles with #!/usr/bin/env bashbot in a directory."
echo "2. Define the on_stdin, on_stdout and prompt functions in the role."
echo "3. Make them executable."
echo "4. export PATH=\"\$HOME/.config/bashbot/roles:\$PATH\""
echo "5. Define a ~/.config/bashbot/agent.sh."
echo ""
echo "This tool does not come with batteries included. It wants you to bring your own agent."
echo "Here is an example of a pi agent hooked up to bashbot:"
echo ""
echo "#!/usr/bin/env bash"
echo ""
echo "pi \\"
echo "  --verbose \\"
echo "  --system-prompt \"\$1\" \\"
echo "  --print"
echo ""
echo "Run 'bashbot' to start using BashBot."