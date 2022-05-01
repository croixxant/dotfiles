set encoding=utf8
set notitle
set ruler               "Show the cursor position
set number              "行番号の表示
set list                "Show invisible characters
set listchars=tab:»\ ,trail:·,nbsp:·,eol:↲
set expandtab           "タブを空白に置き換える
set tabstop=2           "タブ幅
set softtabstop=2       "バックスペースなどで削除する空白の数
set shiftwidth=2        "インデント幅
set autoindent          "改行時に入力された行のインデントを継続する
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set whichwrap=b,s,h,l,<,>,[,]] "カーソルを行頭、行末で止まらないようにする
set backspace=indent,eol,start "バックスペースを有効にする
set colorcolumn=100
set synmaxcol=200       "シンタックスハイライトは一行につき200文字までとする
set nobackup            "ファイル保存時にバックアップファイルを作らない
set noswapfile          "ファイル編集中にスワップファイルを作らない
set wildmenu            "コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set history=100          "keep command line history
set hlsearch            "検索文字列をハイライトする
set incsearch           "do incremental searching
set ignorecase          "大文字と小文字を区別しない
set smartcase           "大文字と小文字が混在している場合は大文字と小文字を区別する
set laststatus=2        "display status line
set clipboard=unnamed
set mouse=a
set visualbell t_vb=
set noerrorbells

nnoremap ; :
nnoremap : ;

lua require('plugins')
