## Philosophy

### Use the right tool for the job

One size doesn't fit all. Vim and its ecosystem work well for Ruby and Rails development, but VSCode or an IDE might be a better choice for a language like TypeScript.

### Start with the problem, not the solution

Prioritise fixing known inefficiencies and frustrations over pursuing speculative improvements.

### Optimise for simplicity and stability

Tools should be reliable and easy to use. If it can't be configured in less than 30 minutes, it might not be worth the investment.

## TODO

### Neovim-only config file

I've switched to Neovim, so don't see much point in maintaining config compatibility with Vim as well. Split into files for plugins, mappings etc.?

### Snippets

Type less.

### Dispatch

See existing feature branch. The main benefit here is test results in the quickfix list. The plugin may require tmux for colorised output, but it also has an iTerm2 strategy. Confirm Pry compatibility.

### Project-specific configuration

Possible options - https://github.com/direnv/direnv/wiki/Vim, https://github.com/vim/vim/issues/1015, EditorConfig

### Improve appearance of Vim highlights

Mostly for aesthetics and consistency across linters. Look at existing constants e.g. `SpellBad`.

### Completion

Is there anything better than Deoplete? Revisit Solargraph/LSP?

### LSP

Try Neovim's built-in client.

## Notes on RubyMine

- My main reason for trialling RubyMine was the promise of better navigation and completion. I found neither to be flawless, nor conclusively better than what I already have available in Vim. I suppose this is a limitation of an IDE targetting a dynamically-typed language.
- A RubyMine workflow would inevitably be more mouse-driven, and therefore probably less ergonomic.
- The Docker Spring integration is broken.
- Using a closed source tool means that you're entirely dependent on the vendor to fix issues like the above.
- RubyMine users are in the minority. Not a reason in itself to discount a tool, but there is an advantage to sharing a workflow and tools with your team.
