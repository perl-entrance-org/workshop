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

## 前回の復習(15分)
* `hello.pl`を使います.
* 既にテンプレートが用意されています. ｢# ここを埋めよう!｣と書かれた部分に適切なコードを書いて, あなたの名前を表示するページを表示するようにしましょう.
* 端末で`$ morbo hello.pl`を実行し, ブラウザで`localhosot:3000`にアクセスすれば, 挙動を確認することができます.
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
			<input type="text" name="name" size="20">
			<input type="submit" name="submit" value="送信">
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

			<input type="text" name="name" size="20">

* ここがフォームの本体です. `<input>`で, データを入力する部品を用意することができます.
* `type`は部品の形状を指定します. 例えば`text`は, <input type="text" name="name" size="20"> このようなテキストを入力できる部品を用意してくれます.
	* `text`以外にも, ラジオボタン`radio`, チェックボックス`checkbox`などがあります.

## 解説(3)
			<input type="submit" name="submit" value="送信">

* `submit`は送信ボタン( <input type="submit" name="submit" value="送信"> )です. ボタンには, `value`で指定した文字が表示されます.
* 送信ボタンを押すと, 入力されたデータは, `<input>`内部の`name`で指定された文字列と紐付られ, `action`で指定されたページへ転送されます.

## コードの書き換え
	use Mojolicious::Lite;
	use utf8;
	
	get '/' => sub {
		my $self = shift;
		$self->render();
	} => 'index';
	
	app->start;

* コードの部分(`__DATA__`より上の部分)は特に処理を行う必要がないので, このように変更します.
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
	my $name = $self->param('name') || 'none';

* `param`を使うことで, フォームから送信されたデータを受け取ることができます.
* 先程, テキストボックスは`<input type="text" name="name" size="20">`で宣言していた為, テキストボックスに入力された名前は`name`で参照することができます.
* `$self->param('name') || 'none'`としているのは, 入力が空だった場合にわかりやすくする為です(｢こんにちはnoneさん｣と表示される).

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
				<td><%= $data{$topic} %></td>
			<tr>
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

## 質問タイム
<!-- data-scale="0.5" -->

## お疲れさまでした
<!-- data-scale="0.2" -->
