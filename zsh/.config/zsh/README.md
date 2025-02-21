## Directory Layout

```
~/.zshrc
~/.config/
└── zsh/
    ├── zshrc               # Main config that .zshrc will source
    ├── aliases.zsh         # All your aliases
    ├── exports.zsh         # Environment variables, PATH, etc.
    ├── functions.zsh       # (Optional) Put your custom functions here
    ├── keymaps.zsh         # Key bindings
    ├── plugins.zsh         # Plugin-related lines (plug statements, etc.)
    ├── credentials.zsh     # API keys, secrets (NOT committed to Git)
    └── completions/        # Directory for custom completion scripts
```

## Ignore ZSH credentials

.config/zsh/credentials.zsh
