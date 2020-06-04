
 
目次
0.	改訂履歴	2
1.	はじめに	2
1.1.	目的	2
1.2.	対象者	2
1.3.	略語集	3
2.	開発ツール標準	3
2.1.	構築手順	3
2.1.1.	事前準備	3
2.1.2.	サクラエディタ	4
2.1.3.	コマンドプロンプト	11
2.1.4.	PowerShell	13
2.1.5.	Scoop	14
2.1.6.	Git	15
2.1.7.	Git Bash	18
2.1.8.	Zulu OpenJDK	20
2.1.9.	Salesforce CLI	24
2.1.10.	Visual Studio Code	27
2.1.11.	Visual Studio Code拡張機能	30
2.1.12.	Node.js	34
2.1.13.	Yarn	39
2.2.	利用ルール	40
2.2.1.	Salesforce開発	40
2.2.2.	その他	40

 
0.	改訂履歴
更新日	バージョン	内容	更新者
2019/05/01	1.0		初版作成	takahito.miyamoto
2020/04/08	2.0		第2版作成	takahito.miyamoto
			

	年1回程度、最新のテクノロジー動向を考慮して本文書を改訂する。
	マイナーアップデートはオンライン上のドキュメントにて実施する。
	不明点は更新者にコンタクトすること。
https://innersource.accenture.com/projects/JP-SFDC-COE/repos/salesforce-development-standards/browse/docs/dev-tools-standards

1.	はじめに
1.1.	目的
本文書により、Salesforceを利用したアプリケーション開発において対象者が利用すべき開発ツール群を定義する。最終更新日時点でベストと思われるツールの組み合わせを記載しているが、プロジェクトによっては既に導入済みあるいは導入予定の別ツールが存在する可能性があるため、個々のツールの採用可否はプロジェクトごとに判断することとする。

1.2.	対象者
本文書の意図する対象者は、Windows端末にてSalesforceを利用したアプリケーション開発に関わる以下のメンバーとする：
	アーキテクチャ担当者
	コーディング担当者
	テスト担当者
	デプロイ担当者

1.3.	略語集
特に断りのない限り、本文書を通して以下の略語を何の説明もなく用いることがある。
略語	意味
CI	Continuous Integration
CLI	Command Line Interface
CSS	Cascading Style Sheets
MS Teams	Microsoft Teams
npm	Node Package Manager
nvm	Node.js Version Manager for Windows
SFDC	Salesforce.com
VS Code	Visual Studio Code

2.	開発ツール標準
原則として、以下のツールをインストールおよびセットアップして利用する。
テーマ	ツール
ソースコード管理 - ローカル	Git
ソースコード管理 - リモート	GitHubまたはBitbucket
コードレビュー	GitHubまたはBitbucket
Gitクライアント	VS Code
テキストエディタ	VS Codeおよびサクラエディタ(*)
コンソール	コマンドプロンプトおよびPowershellおよびGit Bash
静的解析	ESLintおよびApex PMD
コード整形	Prettier
コミュニケーション	MS Teams
自動化スクリプト	Node.jsおよびYarn

(*) サクラエディタ以外にお気に入りのテキストエディタがあればそれを利用してもよい。Windows標準の「メモ帳」は不可とする。

2.1.	構築手順
2.1.1.	事前準備
各種ツールのインストーラーによっては、インストール先のフォルダをデフォルトで設定しているものが多く存在する。しかし、それぞれのインストール先がバラバラな状態を放置していると、あとから目的の場所を見つけられなくなり、バージョンアップやアンインストール作業が滞ることがある。そのような事態を避けるため、Cドライブの下にツール専用のフォルダを新規作成し、原則としてその配下に各種ツールをインストールする。
 

また、ダウンロードした各インストーラーは特定の場所に移動させてからインストール作業を実施する。
 

これ以降は、
	インストール場所： C:\tools
	インストーラーの保存場所： C:\tools\_installer
を前提とした手順を記載する。

また、作業の途中で以下の画面がポップアップすることがある。その場合は、「Accenture Business」を選択して「Yes」をクリックすればよい。
 

2.1.2.	サクラエディタ
※サクラエディタ以外のテキストエディタを利用したい場合は、各自手順を調べてインストールすること。
次のURLにアクセスし、最新版のインストーラーをダウンロードする。
https://sakura-editor.github.io/download.html
 

ダウンロードされた .exeファイルをインストーラー専用フォルダへ移動し、ダブルクリックする。
 

「はい」をクリックする。
 

「次へ」をクリックする。
 

インストール先を指定して、「次へ」をクリックする。
C:\tools\sakura
 

「次へ」をクリックする。
 

「次へ」をクリックする。
 

「次へ」をクリックする。
 

「「SAKURAで開く」メニューの追加」をチェックし、「次へ」をクリックする。
 

「インストール」をクリックする。完了するまで待機する。
 

「完了」をクリックする。
 

サクラエディタの画面が開くことを確認する。
※すぐに起動できるように、サクラエディタのアイコンをタスクバーに常駐させておくことを推奨する。
 

Windowsのスタートメニューから「システム環境変数の編集」を起動する。
 

「環境変数」をクリックする。
 

ユーザの環境変数「Path」に次のパスを新規追加する。
C:\tools\sakura
 

 

「OK」 > 「OK」 > 「OK」 をクリックして編集を完了する。

2.1.3.	コマンドプロンプト
ディレクトリの階層が深くなると、コマンドプロンプトのプロンプト表示が長くなる。コマンド部分が改行されて一番左に来るように変更する。
※好みに応じて表示形式は変えてよい。

Windowsのスタートメニューから「システム環境変数の編集」を起動する。
 

「環境変数」をクリックする。
 

ユーザの環境変数に「PROMPT」を新規追加する。
	変数名: PROMPT
	変数値: $_$D$S$T$S$$$S$P$S$_$G$S
 

「OK」 > 「OK」 > 「OK」 をクリックして編集を完了する。
コマンドプロンプトを起動し、表示が変わったことを確認する。
 

2.1.4.	PowerShell
ディレクトリの階層が深くなると、PowerShellのプロンプト表示が長くなる。コマンド部分が改行されて一番左に来るように変更する。
※好みに応じて表示形式は変えてよい。

PowerShellを起動して次のコマンドを実行する。
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
Y
New-Item -path $profile -type file -force
sakura $profile


サクラエディタが開くので次のコードを貼り付けて保存する。
※好みに応じて表示形式は変えてよい。
function prompt () {
  Write-Host ""
  Write-Host (Get-Date -Format "yyyy.MM.dd HH:mm") $ (Split-Path (Get-Location) -Leaf) -NoNewLine
  $branch = ""
  if (git branch) {
    (git branch | select-string "^\*").ToString() | set-variable -name branch
    $branch = $branch.trim() -replace "^\* *", ""
    Write-Host "[$branch]" -ForegroundColor "Green" -NoNewLine
  }
  Write-Host ""
  return "> "
}


再度PowerShellを起動して、プロンプトが変更されたことを確認する。
 

2.1.5.	Scoop
Scoopを活用することでコマンドラインから各種ツールをインストールできる。
以下のツールのインストールのために、Scoopを導入する。
	Git、Git Bash （インストール手順の短縮化のため）
	Yarn （インストーラーから実行すると警告が出るため）

PowerShellを起動して次のコマンドを実行する。
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
iwr -useb get.scoop.sh | iex


 

次のコマンドを実行して、Scoopのヘルプ情報が確認できたらインストール成功。
scoop help


 

2.1.6.	Git
PowerShellを起動して次のコマンドを実行する。
scoop install git


次のコマンドを実行して、Gitのバージョンが確認できたらインストール成功。
git --version

※キャプチャ通りのバージョン番号でなくてOK。
 

次のコマンドを実行する。
※[Enterprise ID] と [Email] は適宜修正してから実行する。
git config --global user.name [Enterprise ID]
git config --global user.email [Email]
git config --global core.quotepath false
git config --global merge.tool vscode
git config --global diff.tool vscode
git config --global core.autocrlf input
git config --global core.editor sakura

sakura .gitconfig


サクラエディタが開き、Gitの設定を参照できることを確認する。
確認したらファイルを閉じる。
 

フォルダを右クリックした際に「Git Bash で開く」のコンテキストメニューが表示されるように、レジストリへ登録する。
PowerShellで次のコマンドを実行する。
New-Item -Type File addGitBashHere.reg
sakura addGitBashHere.reg


サクラエディタでaddGitBashHere.regファイルが開くので、「SJIS」で開き直す。
 

次のコードを貼り付けて保存する。
※[Enterprise ID] は適宜修正してから保存する。
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\shell\GitBashHere]
@="Git Bash で開く"
"Icon"="\"C:\\Users\\[Enterprise ID]\\scoop\\apps\\git\\current\\git-bash.exe\""

[HKEY_CLASSES_ROOT\Directory\shell\GitBashHere\command]
@="\"C:\\Users\\[Enterprise ID]\\scoop\\apps\\git\\current\\git-bash.exe\" \"--cd=%1\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\GitBashHere]
@="Git Bash で開く"
"Icon"="\"C:\\Users\\[Enterprise ID]\\scoop\\apps\\git\\current\\git-bash.exe\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\GitBashHere\command]
@="\"C:\\Users\\[Enterprise ID]\\scoop\\apps\\git\\current\\git-bash.exe\""


PowerShellで次のコマンドを実行する。
.\addGitBashHere.reg


「はい」をクリックする。
 

「OK」をクリックする。
 

任意のフォルダを右クリックし、「Git Bash で開く」のコンテキストメニューが追加されていることを確認する。
 

※もしこのコンテキストメニューを削除したい場合は、Powershellを「管理者として起動する」で起動し、次のコマンドを実行すればよい。
reg.exe delete "HKEY_CLASSES_ROOT\Directory\shell\GitBashHere"
Yes
reg.exe delete "HKEY_CLASSES_ROOT\Directory\Background\shell\GitBashHere"
Yes

2.1.7.	Git Bash
Git Bashのプロンプトの表示が長いので、見やすさのために短く変更する。
※好みに応じて表示形式は変えてよい。

PowerShellを開き、次のコマンドを実行して、.bashrc をサクラエディタで開く。
sakura .bashrc

※ファイルが存在しない場合は新規作成される。

次の内容を上書き保存してファイルを閉じる。
# 日本語の文字化け対応
function wincmd() {
    CMD=$1
    shift
    $CMD $* 2>&1 | iconv -f CP932 -t UTF-8
}

# 日本語文字化け コマンド一覧（必要に応じて随時追加）
alias java='wincmd java'

# Git Bashのプロンプト表示
export PS1=$'\n''\D{%Y.%m.%d} \A $ \W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]'$'\n> '


WindowsのスタートメニューからGit Bashを起動する。
 

.bashrcが読み込まれてプロンプトが変更されたことを確認する。
※ .bash_profile が存在しない場合は、エラーメッセージのあとにファイルが自動生成される。
 

2.1.8.	Zulu OpenJDK
2020年4月1日時点では、Java 11あるいはJava 8をインストールする必要がある。
ここではData Loaderをインストールする際に必要となるZulu OpenJDKを採用する。

次のURLにアクセスする。
https://www.azul.com/downloads/zulu/

条件を選択し、「.msi」をクリックする。
	Java Version: Java 11 (LTS)
	Operating System: Windows
	Architecture: x86 64-bit
	Java Package: JDK

 

ダウンロードされた .msiファイルをインストーラー専用フォルダへ移動し、ダブルクリックする。
 

「Next」をクリックする。
 

インストール先を指定して、「Next」をクリックする。
C:\tools\Zulu\zulu-11\

「Install」をクリックする。完了するまで待機する。
 

「Finish」をクリックする。
 

Windowsのスタートメニューから「システム環境変数の編集」を起動する。
 

「環境変数」をクリックする。
 

システム環境変数「Path」をダブルクリックする。
 

「C:\tools\Zulu\zulu-11\bin\」を選択したまま、「上へ」を何度もクリックして一番上に移動させる。
 

「OK」 > 「OK」 > 「OK」 をクリックして編集を完了する。

PowerShellを開き、次のコマンドを実行して、ZuluのJavaのバージョンが確認できたらインストール成功。
java -version


 

2.1.9.	Salesforce CLI
次のURLにアクセスする。アクセスすると自動的にダウンロードが始まるので、完了するまで待機する。
https://developer.salesforce.com/media/salesforce-cli/sfdx-windows-amd64.exe

ダウンロードされた .exeファイルをインストーラー専用フォルダへ移動し、ダブルクリックする。
 

「Next」をクリックする。
 

インストール先を指定して、「Install」をクリックする。
C:\tools\Salesforce CLI
 

インストールが完了するまで待機し、「Close」をクリックする。
 

PowerShellを開き、次のコマンドを実行して、Salesforce CLIのバージョンが確認できたらインストール成功。
sfdx update
echo y | sfdx plugins:install sfpowerkit
sfdx -v
sfdx plugins --core


 

2.1.10.	Visual Studio Code
次のURLにアクセスする。アクセスすると自動的にダウンロードが始まるので、完了するまで待機する。
https://code.visualstudio.com/docs/?dv=win

ダウンロードされた .exeファイルをインストーラー専用フォルダへ移動し、ダブルクリックする。
 

「OK」をクリックする。
 

「同意する」を選択し、「次へ」をクリックする。
  

インストール先を指定して、「次へ」をクリックする。
C:\tools\Microsoft VS Code
 

デフォルトのまま、「次へ」をクリックする。
 

「その他」オプションをすべてチェックし、「次へ」をクリックする。
 

「インストール」をクリックする。完了するまで待機する。
 

デフォルトのまま、「完了」をクリックする。
 

2.1.11.	Visual Studio Code拡張機能
拡張機能のアイコンをクリックする。
 

以下の拡張機能を検索して順次インストールする。
名称	用途
共通
Git History	コミットログを確認する。ブランチの状況を概観する。
GitLens	様々な切り口で過去の変更内容を行ったり来たりすることを可能にする。
Output Colorizer	ログを色付けして見やすくする。
Prettier - Code formatter	コードをフォーマットする。
Rainbow CSV	CSVに色を付けて見やすくする。
Todo Tree	TODOコメントを一覧で管理できるようにする。
Trailing Spaces	文末の余分なスペースや余分な改行を保存時に自動的に削除可能する。
Live Share	相手を自分のVS Code画面へ招待し、リアルタイムに同時編集可能にする。
zenkaku	半角スペース以外の空白文字（全角スペース、タブ）を検知可能にする。
Bracket Pair Colorizer	括弧を色分けし、対応付けを視覚的に確認できるようにする。
JSON Tools	JSONをクイックに整形可能にする。
Salesforce開発
Salesforce Extension Pack	VS Codeを用いて、Salesforce Platformでカスタム開発を行うことを可能にする。特に、以下の拡張機能も同時にインストールされる。
	Apex
	Apex Interactive Debugger
	Apex Replay Debugger
	Aura Components
	ESLint
	Lightning Web Components
	Salesforce CLI Integration
	Visualforce
Codey Midnight	Salesforce社推奨のVS Codeテーマを追加する。
Lightning Web Components開発
Live HTML Previewer	VS Code内でHTML文書をプレビューできるようにする。
Path Autocomplete	インポートするファイルのパスをオートコンプリートで入力できるようにする。

例）Git History の場合
左上の検索ウィンドウへ「Git History」と入力し、検索結果の中から「Git History」を選択する。
「Install」をクリックして、完了するまで待機する。
 

上記の拡張機能をすべてインストールしたら、それらを有効化する設定をする。
「Ctrl + ,」 を押下してSettings画面を開き、JSONのアイコンをクリックする。
 

settings.jsonへ以下のコードを貼り付ける。
※「C:\\」で始まる箇所は各々の設定によって異なるため、実際に確認して間違っていたら正しく変更しておく。
{
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "editor.formatOnSave": true,
  "editor.minimap.enabled": false,
  "editor.mouseWheelZoom": true,
  "editor.renderWhitespace": "all",
  "editor.tabSize": 2,
  "editor.wordWrap": "on",
  "explorer.confirmDelete": false,
  "extensions.ignoreRecommendations": true,
  "files.eol": "\n",
  "files.trimTrailingWhitespace": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "javascript.updateImportsOnFileMove.enabled": "always",
  "salesforcedx-vscode-apex.enable-semantic-errors": false,
  "salesforcedx-vscode-apex.enable-sobject-refresh-on-startup": false,
  "salesforcedx-vscode-apex.java.home": "C:\\tools\\Zulu\\zulu-11",
  "salesforcedx-vscode-core.detectConflictsAtSync": true,
  "salesforcedx-vscode-core.push-or-deploy-on-save.enabled": false,
  "salesforcedx-vscode-core.retrieve-test-code-coverage": true,
  "salesforcedx-vscode-core.show-cli-success-msg": false,
  "salesforcedx-vscode-core.telemetry.enabled": false,
  "salesforcedx-vscode-lightning.activationMode": "autodetect",
  "salesforcedx-vscode-lightning.showLightningExplorer": true,
  "terminal.integrated.rendererType": "dom",
  "terminal.integrated.shell.windows": "C:\\windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
  "todo-tree.highlights.enabled": true,
  "todo-tree.tree.showScanModeButton": false,
  "todo-tree.filtering.excludedWorkspaces": ["node_modules"],
  "update.showReleaseNotes": false,
  "workbench.colorTheme": "Codey Midnight",
  "workbench.startupEditor": "newUntitledFile",
}


VS Codeを再起動し、左下の歯車アイコン ＞ 「Color Theme」をクリックする。
 

「Codey Midnight」をクリックし、見た目が変わったことを確認する。
※好みに応じて別のテーマを選んでもよい。
 

2.1.12.	Node.js
nvm経由でインストールする手順を採用する。

次のURLにアクセスし、「Latest Release」の「nvm-setup.zip」をダウンロードする。
https://github.com/coreybutler/nvm-windows/releases
 

ダウンロードされた .zipファイルをインストーラー専用フォルダへ移動し、解凍する。
 

「nvm-setup.exe」をダブルクリックする。
 

「I accept the agreement」を選択し、「Next」をクリックする。
 

インストール先を指定して、「Next」をクリックする。
C:\tools\nvm
 

インストール先を指定して、「Next」をクリックする。
C:\tools\nodejs
 

「Install」をクリックする。
 

「Finish」をクリックする。
 

PowerShellを新規で起動し、次のコマンドを実行して、nvmのバージョンが確認できたらインストール成功。
nvm -v


 

次のコマンドを実行して、LTSのバージョンを確認する。
nvm list available


 

この場合、12.16.1がインストール対象のLTSバージョンとなる。
次のコマンドを実行して、LTSバージョンをインストールする。
nvm install 12.16.1
nvm list
nvm use 12.16.1


 
 

次のコマンドを実行して、Node.jsおよびnpmのバージョンが確認できたらインストール成功。
node -v
npm -v


 

2.1.13.	Yarn
PowerShellを起動して次のコマンドを実行する。
scoop install yarn


次のコマンドを実行して、Yarnのバージョンが確認できたらインストール成功。
yarn -v


 

 
2.2.	利用ルール
2.2.1.	Salesforce開発
	VS Codeは定期的にバージョンアップがあるため、プロジェクトが終わったタイミングを見計らって最新バージョンへ更新するようにする。プロジェクト中は更新しないようにする。
※前述の方法で上書きインストールすればよい。
	Node.jsのLTSは定期的にバージョンアップがあるため、プロジェクトが終わったタイミングを見計らって最新のLTSバージョンへ更新するようにする。プロジェクト中は更新しないようにする。
※前述の方法で最新の LTS バージョンをインストールすればよい。
	Salesforce CLIのコマンドを実行する場合、コマンドプロンプトあるいはPowerShellを利用する。Git BashはSalesforce CLIサポート対象外であるためコマンドを実行しないようにする。
	scoopで管理しているツールは定期的にバージョンアップがあるため、プロジェクトが終わったタイミングを見計らって最新バージョンへ更新するようにする。プロジェクト中は更新しないようにする。
※次のコマンドを実行すればよい。
scoop update


2.2.2.	その他
	その他、プロジェクトで取り決めたルールを順守する。

以上

