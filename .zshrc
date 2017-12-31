# C-s による出力ストップ機能を無効化
# 履歴の前方検索と衝突するため
#stty stop undef

# 補完機能を読み込む
# autoload はシェル関数を自動で読み込むシェルの組み込み関数
# -U はエイリアス展開の無効化
# 独自に定義したエイリアスで関数の動作がおかしくならないように
# シェル関数の探索ディレクトリは $FPATH に格納されている
autoload -U compinit

# 補完を有効化
compinit

#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
if [ `uname` = 'Darwin' ]; then
	export PATH=/Applications/MAMP/bin/php/php5.6.10/bin:$PATH
fi


# 通常のプロンプト
PROMPT="%F{cyan}%/%f%# "

# 制御構文中でのプロンプト
PROMPT2="%_%% "

# コマンド訂正時のプロンプト
SPROMPT="correct: %R -> %r ? [Yes/No/Edit/Abort]: "

# 右プロンプト
#RPROMPT="%D{[%Y-%m-%d %H:%M:%S]}"

# 履歴ファイル
HISTFILE=~/.zsh_history

# メモリ上に保存される履歴件数
HISTSIZE=100000000

# 履歴ファイル上に保存する件数
SAVEHIST=100000000

# 同じコマンドを重複して記録しない
setopt hist_ignore_dups

# コマンド履歴を複数の端末で共有
setopt share_history

# コマンドエイリアス
alias rm='rm -fr'
alias df='df -h'
alias du='du -h'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# サフィックスエイリアス
alias -s java=vi
alias -s c=vi

# グローバルエイリアス
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g W='| wc'

# Emacs キーバインド
bindkey -e

# cd 不要
setopt auto_cd

# 自動で pushd
setopt auto_pushd

# コマンド訂正
setopt correct

# 補完候補を詰めて表示
setopt list_packed

# シェル関数 history-search-end を読み込み
autoload -U history-search-end

# ウィジェット history-begginning-search-{back,for}ward-end を
# シェル関数 history-search-end と関連付ける
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Ctrl-P と Ctrl-N を履歴検索に割り当て
# 途中までコマンドを入力した後で検索すると
# その文字列から始まるコマンドを表示する
# カーソルは末尾に移動する
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# vcs_info
autoload -Uz vcs_info

setopt prompt_subst

# 右プロンプトにステータスを表示
RPROMPT='${vcs_info_msg_0_}'

# precmd () は、プロンプトが表示されるたびに実行される関数
# vcs_info で、バージョン管理システムから情報を取得する
precmd () { vcs_info }

# バージョン管理システムへの問い合わせをするか
zstyle ':vcs_info:git:*' check-for-changes true

# ステージされていてコミットされていないファイルがあるときの表示
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}"

# ステージされていないファイルがあるときの表示
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"

# display format of status bar
# %c -> stagedstr
# %u -> unstagedstr
# %b -> 現在のブランチ名
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"

zstyle ':vcs_info:*' actionformats '[%b|%a]'

# ホスト固有の設定や実験的な設定はこちらに記述
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

if [ -z "$TMUX" ]; then
	# tmux ls outputs to stderr.
	SESS="`tmux ls`"
	if [ -z "$SESS" ]; then
		tmux
	fi
	tmux a
fi
