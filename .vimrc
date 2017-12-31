" -------------
" 見た目系
" -------------

" 行番号を表示
set number

" 現在のモードを表示
set showmode

" 対応する括弧を表示
set showmatch

" 対応する括弧に飛ぶ時間
set matchtime=1

" 検索キーワードのハイライトを無効化
set nohlsearch

" ステータスラインを常に表示
set laststatus=2

" シンタックスハイライトを有効化
syntax on

" カーソルがある行をハイライト
set cursorline


" -------------
" タブ系
" -------------

" スマートインデントを有効化
set smartindent

" オートインデントでずれる幅
set shiftwidth=4

" 画面上でタブ文字が占める幅
set tabstop=4

" タブ文字を空白文字に展開
set expandtab


" -------------
" 検索系
" -------------

" 検索対象に大文字が含まれている場合は、区別して検索する
set smartcase

" 検索文字列入力と同時に検索する
set incsearch


" -------------
" その他
" -------------

" jj で Esc を入力
inoremap <silent> jj <ESC>

" 編集中のファイルが変更されたら読み直す
set autoread

