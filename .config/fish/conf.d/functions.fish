function venv
    if not type -q uv
        echo "uv not found."
        return
    end

    if not test -f .venv/bin/activate.fish; and not test -f .venv/Scripts/activate.fish
        uv venv
        echo "Virtual environment created."
    end

    if test -f .venv/bin/activate.fish
        source .venv/bin/activate.fish
    else if test -f .venv/Scripts/activate.fish
        source .venv/Scripts/activate.fish
    else
        echo "Activation script not found (looked for activate.fish)."
    end
end

function ff
    # Fish automatically splits command output by newlines into a list
    set -l repo_dirs (find -L "$HOME/repos" "$HOME/projects" -mindepth 1 -maxdepth 2 -type d 2>/dev/null)
    set -l config_dirs (find -L "$HOME/.config" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)
    set -l dirs $HOME "$HOME/Downloads" "$HOME/Documents" $repo_dirs $config_dirs

    # 'string join' is used to feed the list to fzf
    set -l selected (string join \n $dirs | fzf)

    if test -z "$selected"
        return
    end

    z "$selected"
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function vh
    set -l repo "$HOME/.config/nvim"
    set -l tmpdir "$HOME/tmp/nvim"

    if test -d "$tmpdir"
        git -C "$repo" worktree remove --force "$tmpdir"
    end

    git -C "$repo" worktree add "$tmpdir" HEAD; or return

    # Note: --cmd syntax for nvim is the same
    nvim -u "$tmpdir/init.lua" --cmd "set runtimepath^=$tmpdir"
    
    git -C "$repo" worktree remove --force "$tmpdir"
end

function fish_user_key_bindings
    # Ctrl+f
    bind \cf 'commandline "ts"; commandline -f execute'
    # Ctrl+Backspace
    bind \cH backward-kill-word
    # Ctrl+Delete
    bind \e\[3\;5~ kill-word
end
