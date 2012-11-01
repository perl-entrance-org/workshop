# ![Perl入学式](/images/perl-entrance_t.png)
<!-- data-scale="0.5" -->

# Perl入学式 #9

<http://www.perl-entrance.org>

* 日時
    * 2012年10月21日（日） 14:00 - 17:00
* 会場
    * Joe'sクラウドコンピューティング
    * <http://www.joeswebhosting.net>

## Perl入学式について

* Perl入学式(<http://www.perl-entrance.org>)は, プログラミング未経験者からPerl初心者を対象としたワークショップです
* 公式Twitter
    * [@Perl_Entrance](http://twitter.com/perl_entrance)
* 公式ハッシュタグ
    * \#Perl入学式
* 公式Facebookページ
    * <https://www.facebook.com/PerlEntrance>

## 会場について

* 今回のPerl入学式は「Joe'sオープンソースJelly」の一環ということで、株式会社Joe'sクラウドコンピューティング（<http://www.joeswebhosting.net>）様より特別に会場をお借りしています
* この場をお借りしてお礼申し上げます

## ロゴについて

![Perl入学式](/images/perl-entrance_t_300.png)

* 横山陽平さん(<http://yokoyamayohei.com/>)にデザインしていただきました
* この場をお借りしてお礼申し上げます

## IT勉強会スタンプラリー

![IT勉強会スタンプラリー](/images/it-stamp.png)

* Perl入学式は, IT勉強会スタンプラリー(<http://it-stamp.jp/>)に参加しています
* 今回のPerl入学式は, スタンプラリーの対象となる勉強会です
* 台紙は勉強会終了後にお渡しします

## 喋ってる人

* 名前: papix (ぱぴっくす)
* Twitter: [@\_\_papix\_\_](http://twitter.com/__papix__)
* 仕事: 大学院生
* ブログ: [Masteries](http://papix.hateblo.jp)

## 本日の目標
* 前回は, 本講義のゴールである｢Mojoliciousを使ったウェブアプリケーションの開発｣を目指して, Mojoliciousの基礎を学びました.
* #9では, Mojoliciousを使って小規模なウェブアプリケーションの開発に挑戦しつつ, これまでに学んできたPerlのテクニックを復習していきます.

## 本日の内容
* 前回の復習
* フォームとデータの送信
* Suspendan
* 数あてゲーム

## 準備
* [Perl入学式のgithubアカウント](https://github.com/perl-entrance-org/)に, 第9回で使用するデータが入ったリポジトリがあります.
	* まず最初に, `$ git clone git://github.com/perl-entrance-org/perl-entrance-2012-09.git`でclone(ダウンロード)しましょう.
* gitがインストールされていない場合, インストールしましょう.
	* Ubuntuの場合, `$ sudo apt-get install git-core`でOKです.

## 前回の復習(15分)
* `hello.pl`を使います.
* 既にテンプレートが用意されています. ｢# ここを埋めよう!｣と書かれた部分に適切なコードを書いて, あなたの名前を表示するページを表示するようにしましょう.
* 端末で`cd perl-entrance-2012-09`でcloneしたディレクトリに移動し, `$ morbo hello.pl`を実行します. ブラウザで`localhosot:3000`にアクセスすれば, 挙動を確認することができます.
* 時間に余裕があれば, 自分でテンプレートを用意して, 複数のページを作ってみましょう.

## フォームとデータの送信
* Mojolicious::Liteを使えば, ウェブアプリケーションの見た目を決めるテンプレート(`__DATA__`以下の部分)と, ウェブアプリケーションの挙動を決める部分を1つのファイルで記述できる, ということを学びました.
* しかし, 今まで作ってきたページは全て静的なページ(いつ読み込んでも同じデータが出力される)です.
* 今回は, フォームを使ってウェブアプリケーションに対してデータを送信することで, 動的なページを作ってみましょう.

## hello.plの改造
* 先程作った`hello.pl`は, アクセスすると常にあなたの名前を表示します.
* これを, このように改造してみましょう.
	* アクセスすると, 文字を入力するフォームと, ｢送信｣ボタンが現れる.
	* フォームに名前を入力して, ｢送信｣ボタンを押すと, ｢こんにちは(フォームに入力した名前)さん｣と表示する.

## テンプレートの書き換え
	@@ index.html.ep
	<html>
	<head><title>hello!</title></head>
	<body style='padding: 30px;'>
		<form action="/hello" method="post">
			<input type="text" name="name" size="20" />
			<input type="submit" name="submit" value="送信" />
		</form>
	</body>
	</html>

* トップページのテンプレート(`__DATA__`以下の部分)を, このように書き換えます.

## 解説(1)
		<form action="/hello" method="post">
			...
		</form>

* `<form>`から`</form>`で囲まれた範囲が1つのフォームとなります.
* `<form>`には, どのページにデータを送信するかを`action`で, どんな方法でデータを送信するかを`method`で指定しなければなりません.
	* methodには`post`と`get`が存在します. 詳細は後述します.

## 解説(2)

			<input type="text" name="name" size="20" />

* ここがフォームの本体です. `<input>`で, データを入力する部品を用意することができます.
* `type`は部品の形状を指定します. 例えば`text`は, <input type="text" name="name" size="20"> このようなテキストを入力できる部品を用意してくれます.
	* `text`以外にも, ラジオボタン`radio`, チェックボックス`checkbox`などがあります.

## 解説(3)
			<input type="submit" name="submit" value="送信" />

* `submit`は送信ボタン( <input type="submit" name="submit" value="送信" /> )です. ボタンには, `value`で指定した文字が表示されます.
* 送信ボタンを押すと, 入力されたデータは, `<input>`内部の`name`で指定された文字列と紐付られ, `action`で指定されたページへ転送されます.

## コードの書き換え
	use Mojolicious::Lite;
	use utf8;
	
	get '/' => 'index';
	
	app->start;

* コードの部分(`__DATA__`より上の部分)は特に処理を行う必要がないので, このように変更します.
	* いつもは`get '/'`と `=> 'index'`の間に`=> sub { ... }`でコードを書いていましたが, 今回のように, 処理がない場合は省略可能です.
* とりあえず, この時点で実行してみましょう.

## 実行結果
* 文字を入力するフォームと, 送信ボタンはきちんと出てきますが, フォームに文字を入力して送信ボタンを押すと, `Page not found... yet!`のようなエラー出てくるはずです.
* これは, 送信されたデータを受け取り, ｢こんにちはXXXXさん｣と表示する｢hello｣というページが用意されていない為です.
* 続いて, ｢hello｣というページを作りましょう.

## helloのテンプレート
	@@ hello.html.ep
	<html>
	<head><title>hello, <%= $name %>!</title></head>
	<body style='padding: 30px;'>
		こんにちは<%= $name %>さん
	</body>
	</html>

* コードの部分から`$name`を送り, 表示します.

## コードの追加

	post '/hello' => sub {
		my $self = shift;
	
		my $name = $self->param('name');
	
		$self->stash( name => $name );
		$self->render();
	} => 'hello';

* `app->start;`よりも上に, このようなコードを書きます.

## 解説(1)
	post '/hello' => sub {
		...
	}

* `/hello`というページに, postメソッドでアクセスした際の処理を書きます.
* 先程, `<form>`で`method="post"`と設定したので, 先頭をpostにしています. `method="get"`と設定した場合は`get`にします.

## 解説(2)
	my $name = $self->param('name') || '名無し';

* `param`を使うことで, フォームから送信されたデータを受け取ることができます.
* 先程, テキストボックスは`<input type="text" name="name" size="20">`で宣言していた為, テキストボックスに入力された名前は`name`で参照することができます.
* `$self->param('name') || '名無し'`としているのは, 入力が空だった場合にわかりやすくする為です(｢こんにちはnoneさん｣と表示される).

## 実行結果
* これで正常に動作するはずです.
	* フォームに名前を入れ, 送信ボタンを押せば, ｢こんにちはXXXXさん｣のように, 入力した名前が表示されます.

## 練習問題(20分)
* `question01.pl`を使います.
* 既にテンプレートが用意されていますので, 名前と身長(cm), 体重(kg)を入力すると, `/bmi`に名前とBMIが表示されるように, コードを書いてみましょう.
	* BMIは`身長(kg) / 身長(m) * 身長(m)`で計算できます.

## 複雑なテンプレート
	<table>
		<tr>
			<td>名前</td>
			<td>papix</td>
		</tr>
		<tr>
			<td>身長</td>
			<td>180cm</td>
		</tr>
			:
	</table>

* フォームから名前, 身長, 体重, 年齢, 趣味を入力し, このような表を作るとします.

## 複雑なテンプレート
	<table>
		<tr>
			<td>名前</td>
			<td><%= $name %></td>
		</tr>
		<tr>
			<td>身長</td>
			<td><%= $height %></td>
		</tr>
			:
	</table>

* このように, 1つ1つ書いていくのは面倒です.

## 複雑なテンプレート
* 実は, テンプレートにはperlのコードを埋め込むことができます.
* この機能を使えば, 複雑な(冗長な)テンプレートを, シンプルに書きなおすことができます.
* では, 冗長なテンプレートで書かれた`list.pl`を書き換えて行きましょう.
## コードの書き換え
	post '/data' => sub {
		my $self = shift;
	
		$self->stash( data => {
			'名前' => $self->param('name'),
			'身長' => $self->param('height'),
			'体重' => $self->param('weight'),
			'年齢' => $self->param('age'),
			'趣味' => $self->param('hobby'),
		} );

		$self->render();
	} => 'data';

* テンプレートへは, このようにハッシュを使ってデータを渡します.

## テンプレートの書き換え
	@@ data.html.ep
	<html>
	<head><title>Output</title></head>
	<body style='padding: 30px;'>
		<table>
	% for my $topic (qw/名前 身長 体重 年齢 趣味/) {
			<tr>
				<td><%= $topic ></td>
				<td><%= $data->{$topic} %></td>
			</tr>
	% }
		</table>
	</body>
	</html>

* テンプレートでは, 先頭に`%`がある行はPerlのコードが書かれている, と解釈します.

## 練習問題(30分)

* `question02.pl`の, `__DATA__`以下の部分のみを書き換えて(テンプレートのみを書き換えて)次のような出力を行うページを作ろう.
	* テキストを入力するフォームと, 送信ボタンを持つ.
	* 送信ボタンを押すと, `/do`というページに, フォームに入力したデータを送信する.

## 練習問題(30分)
* `/do`ページでは, 次のような処理を行う.
	* フォームに入力した文字がアルファベットの場合, `hello, (入力した文字列)さん!`と表示する.
	* フォームに入力した文字が`+`, `-`, `/`, `*`, `%`で区切られた2つの数値(例えば`123+45`)なら, その演算を行い, 結果を出力する(例の場合, `123 + 45 = 168`と表示する).
	* それ以外の場合, `undefined`と表示する.

## レイアウト
	<html>
	<head><title>... title ...</title></head>
	<body style='padding: 30px;'>
		... contents ...
	</body>
	</html>

* テンプレートの中で, 常に同じ記述を使うという箇所がいくつかあります.
* 例えば, 上記のヘッダの部分など.

## レイアウト
* レイアウトを使えば, このような｢複数のページで同一の記述｣をまとめることができます.
* それでは早速, 使ってみましょう.
	* 先程使った`list.pl`を, レイアウトを使って更に改造します.

## レイアウト
	@@ layouts/common.html.ep
	<html>
	<head><title><%= $title %></title></head>
	<body style='padding: 30px;'>
		<%= content %>
	</body>
	</html>

* `__DATA__`以下の部分にレイアウトを記載します.
* `<%= content %>`には, それぞれのページで表示する内容が埋め込まれます.
* ヘッダは共有でも, ページのタイトルはそれぞれ異なります. `<%= $title %>`とすることで, その部分だけ変更することができます.

## レイアウト
	@@ index.html.ep
	% layout 'common', title => 'Input'
		<form action="/data" method="post">
			名前: <input type="text" name="name" size="20"><br>
				...
			趣味: <input type="text" name="hobby" size="20"><br>
			<input type="submit" name="submit" value="送信"><br>
		</form>

* レイアウトを使うと, テンプレートをこのように書くことができます.
* `% layout 'common'`で使用するテンプレートの名前を指定します. 更に,`title => 'Input'`でページのタイトルを変更することができます(テンプレートの`<%= $title %>`に埋め込まれる).

## 練習問題(15分)
* `list.pl`の, `data.html.ep`のテンプレートを, レイアウトを使うように書き換えてみよう.

## getとpost
* 続いて, getとpostの違いを見てみましょう.
* `post.pl`を使います.

## postメソッド
* この`post.pl`は, postメソッドを使って書かれています.
* 早速実行してみましょう.
* フォームに名前を入力し, 送信ボタンを押すと, フォームに格納されたデータが, `/data`に転送されます.

## getメソッド
* 次に, この`post.pl`を, getメソッドを使うように書き換えます.
* まず, `post.pl`を, `get.pl`という名前でコピー(`$ cp post.pl get.pl`)します.

## getメソッド
	<form action="/data" method="get">
		名前: <input type="text" name="name" size="20"><br>
		<input type="submit" name="submit" value="send"><br>
	</form>

* テンプレートのフォームの部分を, このように書き換えます.
* methodを, `post`から`get`に書き換えます.

## getメソッド
	get '/data' => sub {
		my $self = shift;
	
		my $name = $self->param('name');
		
		$self->stash( name => $name );
		$self->render();
	} => 'data';

* コードの部分は, このように書き換えます. 先頭を, `post`から`get`に書き換えることで, `/data`に対してgetメソッドでアクセスした場合の処理を書くことができます.
* getもpostも, `$self->param()`で送られたデータを受け取ることができます.

## getメソッド
* 書き換えはこれで完了です. 早速実行してみましょう.
	* postメソッドと何が異なるでしょうか?

## getとpostの違い
* get
	* 送られるデータは, URLの後ろに付けられる.
	* その書式は, `URL?name=value&name=value ...`となる.
	* アルファベット以外のnameやvalueは, URLエンコードされる. 
* post
	* 送られるデータは, 標準入力として与えられる(URLに影響はない).

## 結局のところ...
* mojoliciousを使っているならば, ｢getメソッドは送るデータがURLに付く｣, ｢postメソッドは送るデータがURLに付かない｣という, 単純な認識でいい... のではないかと思います.

## ちなみに...
* getメソッドはURLに送るデータを与えるので, このようなこともできます.
* `get.pl`を起動し, `localhost:3000/data?name=papix`にアクセスすると...
	* `post.pl`でも同様の行為を行うとどうなるでしょうか...?

## 最終問題(30分)
* 次のような挙動をするページを作ってみよう.
	* `/`にアクセスすると, 1つのテキストボックスと送信ボタンが表示される.
	* 送信ボタンを押すと, getメソッドで`/output`にデータを送る.
	
## 最終問題(30分)
* `/output`では次のような処理を行う.
	* 送られたデータがアルファベットの文字列ならば挨拶する. 例えば`perl-entrance`が送られたなら, `hello, perl-entrance!`などのように表示する.
	* 送られたデータが整数なら, それを3乗した値を示す. 例えば`-2`が送られたなら, `-2の3乗は-8`などのように表示する.
	* 送られたデータが小数なら, その整数部を示す. 例えば`-12.3456`が送られたなら, `-12.3456の整数部は-12`などのように表示する.
	* 送られたデータが空なら, `undefined`と表示する.
	* これらの全てに当てはまらない場合, `error`と表示する.

## アルティメット最終問題(∞分)
* `rev_polish`関数を作ろう.
	* `rev_polish`関数は, [逆ポーランド記法](http://ja.wikipedia.org/wiki/%E9%80%86%E3%83%9D%E3%83%BC%E3%83%A9%E3%83%B3%E3%83%89%E8%A8%98%E6%B3%95)の計算を行う関数である.
	* 引数として, 逆ポーランド記法が書かれた文字列を受け取り, (`&rev_polish('3 4 +')`など), その計算結果を返す.
	* 使用可能な演算子は加算(+), 減算(-), 乗算(\*), 除算(/), 剰余算(%)とする. 使用可能な値は整数のみとする(`3 1.2 +`などは不可).
	* 計算できない場合(例えば, `1 2 3 +`や`3 1.2 +`など)は, undefを返す.

## アルティメット最終問題(∞分)
* 最終問題で作ったページで, 送られたデータの先頭に`P:`が付く場合, それ以降のテキストを逆ポーランド記法の式として, rev_polish関数で演算するように書き換えよう.
* 答えが導けた場合, 演算した式と, その答えを表示する. 例えば送られたデータが`1 2 +`なら, `1 2 + の演算結果は 3 です`などと表示する.
* 答えが導けない場合, 演算した式と, `演算できませんでした`という文字を表示する.

## 質問タイム
<!-- data-scale="0.5" -->

## お疲れさまでした
<!-- data-scale="0.2" -->
