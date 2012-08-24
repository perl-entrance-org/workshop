# ![Perl入学式](/images/perl-entrance_t.png)
<!-- data-scale="0.5" -->

# Perl入学式 #7

<http://www.perl-entrance.org>

* 日時
    * 2012年7月22日（日） 14:00 - 17:00
* 会場
    * 新大阪コワーキング

## Perl入学式について

* Perl入学式(<http://www.perl-entrance.org>)は, プログラミング未経験者からPerl初心者を対象としたワークショップです
* 公式Twitter
    * [@Perl_Entrance](http://twitter.com/perl_entrance)
* 公式ハッシュタグ
    * \#Perl入学式
* 公式Facebookページ
    * <https://www.facebook.com/PerlEntrance>

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

* 名前    : papix (ぱぴっくす)
* Twitter : [@\_\_papix\_\_](http://twitter.com/__papix__)
* 仕事    : 大学院生
* 一言    : Perlって, 本当にイイですねぇ.

## [YAPC::Asia](<http:/yapcasia.org/2012/>)に行こう!

* Yet Another Perl Conference
    * 日本最大級のPerlの祭典!
    * 9月27日から29日まで, 東京大学で開催

## Perl入学式も出ます!(予定)

* [Perl入学式をやってみた!](http://yapcasia.org/2012/talk/show/2c8dfc82-bd2b-11e1-a568-b39f6aeab6a4)
* よければ, "Like"ボタンや"イイネ!"ボタンなどを押してもらえると...(ry

## 本日の内容

* 復習問題とお約束
* mapとgrep
* めざせ! 正規表現マスター!
* 最終問題

## 復習問題

**目標時間 : 20分**

* 端末から, 文字列を入力しよう.
* その文字列に`perl`が含まれる場合, `We love perl!`と表示しよう.
* `END`が入力されるまで, この処理を続けよう.

## 休憩(10分)
<!-- data-scale="0.5" -->

## お約束
    #!/usr/bin/env perl
    use utf8;
    use strict;
    use warnings;
    
    binmode STDIN,  ":encoding(UTF-8)";
    binmode STDOUT, ":utf8";
    binmode STDERR, ":utf8";

* スクリプトを書く前に, このお約束のコードを書くようにしましょう.
* これ以下, お約束は省略します.

## mapとgrep

* mapとgrepって何?
	* ｢配列を操作する, 結構スマートなやり方｣です!

## 実際にmapを使ってみよう!

* 例えば, ある配列の全ての要素に含まれる`@`を` at `に書き換えたい場合を考えます.
	* 要はスパム対策ですね.

## 今までの場合...

	my @mails = ('papix2011@gmail.com', 'hogehoge@fugafuga.com');
	my @no_spam;
	for my $mail (@mails) {
		$mail =~ s/\@/ at /;
		push @no_spam, $mail;
	}
	print join("\n", @no_spam);

* 今までに紹介した方法で実現しようとすると, おそらくこんな感じになると思います.

## mapを使うと...
	my @mails = ('papix2011@gmail.com', 'hogehoge@fugafuga.com');
	my @no_spam = map{ my $mail = $_; $mail =~ s/\@/ at /; $mail; } @mails;
	print join("\n", @no_spam);

* たった3行で実現できます! とってもシンプルでいいですね.

## mapの使い方
	my @no_spam = map{ my $mail = $_; $mail =~ s/\@/ at /; $mail; } @mails;

* 右側に, 入力となる配列を書きます. 今回の場合, `@mails`です.
* mapは, `{`と`}`で囲った中に, 配列(今回の場合は`@mails`)の各要素に対して行いたい処理を書きます.
	* 入力となる配列の各要素は`$_`に格納されます. 但しこれは元の要素へのリファレンスなので, 元の要素を変更したくない場合は, 例のように別の変数に格納する必要があります.
* 左側に, 結果を格納する配列を書きます. 今回の場合, `@no_spam`です.

## 実際にgrepを使ってみよう!

* 例えば, 配列の要素から10以下の値のみを抜き出した配列を作りたい, という場合を考えます.

## 今までの場合...
	my @num = (1, 12, 10, 3, 5, 20, 8, 13, 19, 6);
	my @mini;
	for my $i (@num) {
		push(@mini, $i) if($i <= 10);
	}
	print join(',', @mini);

* 今までに紹介した方法で実現しようとすると, おそらくこんな感じになると思います.

## grepを使うと...
	my @num = (1, 12, 10, 3, 5, 20, 8, 13, 19, 6);
	my @mini = grep { $_ <= 10 } @num;
	print join(',', @mini);

* こちらも, たった3行で実現できます! とってもシンプルでいいですね.

## grepの使い方
	my @mini = grep { $_ <= 10 } @num;

* 右側に, 入力となる配列を書きます. 今回の場合, `@num`です.
* grepは, `{`と`}`で囲った中に書かれた条件を満たす要素のみで配列を作ります.
	* この場合, 配列(今回の場合は`@num`)の各要素に対して10以下かどうか(`$_ <= 10`)をチェックして, これを満たす要素のみを含む配列を作ります.
	* mapと同じく, 入力となる配列の各要素は`$_`で示されます.
* 左側に, 結果を格納する配列を書きます. 今回の場合, `@mini`です.

## map/grepを使う利点

* 紹介したように, map/grepはfor文で書くこともできます.
* そこであえてmap/grepを使う理由は, そのコードの意味を明確にできる, という点ではないでしょうか.
* grepなら, ｢配列にフィルターをかける｣, mapなら, ｢配列の要素を変換する｣という意味を, コードを読む人に伝えることができます.
	* 但し, map/grepを単なるループ処理をする為に使うのはよくない, ...そうです.

## 練習問題(20分)

* 配列を受け取ると, 受け取った配列の全ての要素に` is perl monger!`を付け足した配列を返す関数を作ってみよう.
* 例えば, 配列の要素の1つが`papix`の場合, `papix is perl monger!`と書き換えられます.
* 但し, 配列の要素が`yapc`の場合, ` is perl conference!`を付け足すようにしましょう.

## めざせ! 正規表現マスター!
* データ処理の強い味方, パターンマッチと正規表現について学んでいきます.
* パターンマッチや正規表現については以前簡単に説明していますが, 今回はもっと掘り下げていきます.
* 正規表現は非常に複雑なので, 今回だけで｢正規表現マスター｣になるのは難しいかもしれませんが, ｢正規表現マスター｣を目指してがんばっていきましょう!

## パターンマッチの復習
	my $str = 'Perl Entrance #7 一緒にPerlを学びましょう!';
	print "'$str'は'Perl'を含みます." if $str =~ /Perl/;

* 簡単なパターンマッチの例です.
* `$str`の文字列中に, `/`で囲まれた正規表現で示される文字列が存在するなら, ｢マッチした｣と扱われ, 真となります.
	* よって, print文が実行されます(#6で紹介した, 後置ifを使っています).
* この｢パターン｣を表現する為に, 正規表現を使います.
	* 使いこなせば, あなたのお仕事を助ける協力な武器になります.

## 任意の1文字
	my $ans = 'y';
	if($ans =~ /[yY]/) {
		print "文字列にはyないしYが含まれています.\n";
	}

* `[`と`]`で文字をくくると, []の中の任意の1文字にマッチします.
* よって`/[yY]/`は, `y`ないし`Y`にマッチします.

## 任意の1文字(否定)
	my $ans = 'n';
	if($ans =~ /[^yY]/) {
		print "文字列にはyないしY以外の文字が含まれています.\n";
	}

* `[`と`]`で文字をくくり, その先頭に`^`を置くと, []の中にない任意の1文字にマッチします.
* よって`/[^yY]/`は, `y`ないし`Y`以外の文字にマッチします.
* `^`は, 必ず`[`の後に置いて, `[^`の形で用います.

## 任意の1文字(連続)
	my $ans = '1';
	if($ans =~ /[a-c]/) {
		print "文字列にはa, b, cのいずれかが含まれています.\n";
	}

* `[`と`]`の中で, 文字の間に`-`を挟むことによって, 文字列の範囲を表現できます.
* この場合, `[a-c]`は`[abc]`と同じ意味になります. `[1-5]`のように, 数値に対しても利用できます.

## ワイルドカード
	my $ans = 'get';
	if($ans =~ /g.t/) {
		print "マッチ!\n";
	}

* `.`は, 改行文字(`\n`)を除く, 任意の1文字にマッチします.
* よって`/g.t/`は, `get`や`got`など, `g+任意の1文字+t`にマッチします.
	* `.`がマッチするのは1文字だけなので, `goat`などはマッチしません.
	* また, `gt`にもマッチしません.

## 量指定子'?'
	my $ans = 'gt';
	if($ans =~ /g.?t/) {
		print "マッチ!\n";
	}

* `?`は, その直前の要素が0個または1個の場合にマッチします.
	* 例えば`ab?`は, `a`または`ab`にマッチします.
* よって`/g.?t/`は, `g+任意の1文字+t`に加え, `gt`にもマッチします.

## 量指定子'+'
	my $ans = 'get';
	if($ans =~ /g.+t/) {
		print "マッチ!\n";
	}

* `+`は, その直前の要素が1個以上の場合マッチします.
	* 例えば`ab+c`は, `abc`や`abbbbc`などにマッチしますが, `ac`にはマッチしません.
* よって, `/g.+t`は, `g+任意の1文字以上+t`にマッチします.

## 量指定子'*'
	my $ans = 'great';
	if($ans =~ /g.*t/) {
		print "マッチ!\n";
	}

* `*`は, その直前の要素が0個以上の場合マッチします.
	* 例えば`ab*c`は, `ac`や`abc`, `abbbbbc`などにマッチします.
* よって`/g.*t/`は, `g`で始まり`t`で終わる全てのフレーズとマッチします(`great`など).

## 柔軟な量指定子
	my $str = 'Gyaaaaaaaaa!';
	print "マッチ!\n" if $str =~ /a{5,}/;
	# マッチする
	my $str2 = 'Gyaa!';
	print "マッチ!\n" if $str2 =~ /a{5,}/;
	# マッチしない

* `{m,n}` ... その直前の要素がm回以上, n回以下繰り返す場合マッチ
* `{m,}` ... その直前の要素がm回以上繰り返す場合マッチ
* `{m}` ... その直前の要素がm回繰り返す場合マッチ

## マッチした文字列の取得
	my $str = '私は perl が好きです.';
	if($str =~ /私は (.+) が好き/) {
		print "彼は, $1 が好きです.\n";
		# '彼は, perl が好きです'と表示.
	}

* 正規表現のパターンを`()`を囲むと, そのパターンに一致する文字列を取得することができます.
* 例えばこの場合, $1には`perl`が入り, `彼は, perl が好きです.`と表示されるはずです.

## マッチした文字列の取得
	my $str = '私は perl と 旅行 が好きです.';
	if($str =~ /私は (.+) と (.+) が好き/) {
		print "彼は, $1 と $2 が好きです.\n";
		# '彼は, perl と 旅行 が好きです.'と表示.
	}

* 複数の`()`が存在する場合, 先頭から`$1`, `$2`... で取得することができます.

## マッチングの原則
	my $str = 'Hello hoge! Hello fuga!';
	if($str ~= /Hello (.+)!/) {
		print "Nice to meet you, $1!\n";
	}

* `hoge`を抜き出して`Nice to meet you, hoge!`としたいので, このようなコードを書きました.
* しかしながら, 実際には`Nice to meet you, hoge! Hello fuga!`と表示されます.

## マッチングの原則
	my $str = 'Hello hoge! Hello fuga!';
	if($str ~= /Hello (.+?)!/) {
		print "Nice to meet you, $1!\n";
	}

* これは, 正規表現が｢なるべく長くマッチする(最長マッチ)｣ようになっている為です.
* このように, 量指定子のあとに`?`を付けて, 最短マッチにすれば, `Nice to meet you, hoge!`と出力されるはずです.

## 練習問題A(15分)

	while( chomp (my $line = <STDIN>) ) {
		print $line;
	}

* 上記プログラムは, 標準入力で入力した文字列をそのまま出力するプログラムである.
* これを改変して, 入力した文字列に`john`が含まれる場合のみ, 文字列を出力しないように書き換えてみよう.

## 休憩(10分)

## 置換
	my $str = 'abc def ghi';
	$str =~ s/abc/ABC/;
	# $str = 'ABC def ghi';

* `s/PATTERN/REPLACE/`で, `PATTERN`を`REPLACE`に置換します.
* 全てのPATTERNを置換したい場合, `s/PATTERN/REPLACE/g`と表記します.
	* 最後にオプションとして`g`を付けることで, 繰り返し評価します.

## 変数の使用

	my $str = 'perl ruby python';
	my $pattern = 'perl';
	if($str =~ /$pattern/) {
		print "'$str'には'$pattern'が含まれます.\n";
	}

* このように, 正規表現として変数を利用することもできます.

## メタ文字
* メタ文字を使うと, ｢数字とマッチ｣や｢アルファベットとマッチ｣などといった正規表現を, より簡単に表現することができます.
* ここでは, よく使うメタ文字を紹介します.

## メタ文字(1)
* `\w` ... アルファベット, 数字, アンダーバーの1文字
	* `[a-zA-Z0-9_]`と同じ意味です.

* `\W` ... アルファベット, 数字, アンダーバー以外の1文字
	* `[^a-zA-Z0-9_]`と同じ意味です.

* `\d` ... 数字の1文字
	* `[0-9]`と同じ意味です.

* `\D` ... 数字以外の1文字
	* `[^0-9]`と同じ意味です.

## メタ文字(1)
* `\s` ... 空白文字にマッチ
	* `[ \n\r\f\t]`と同じ意味です.

* `\S` ... 空白文字以外にマッチ
	* `[^ \n\r\f\t]`と同じ意味です.

## メタ文字(1) 使い方
	my $str1 = '2012年7月22日';
	if($str1 =~ /(\d+)年(\d+)月(\d+)日/) {
		print "$1/$2/$3";
		# "2012/7/22"と表示される.
	}
	my $str2 = "この     文章  は\n 読みにく\nい    で  \t        す\n";
	my $str2 =~ s/\s+//g;
	# $str2 = "この文章は読みにくいです";

* `\s`を使えば, 余分な空白や改行を抜き取ることができます.

## メタ文字(2)
* `|` ... 選択一致
	* 例えば, `abc|def|ghi`は, `abc`, `def`, `ghi`のいずれかにマッチします.

* `(x)` ... グループ化
	* 正規表現をグループ化します.
	* 先に説明したように, `()`の中のパターンにマッチした文字列は記憶されます(後方参照).

* `(?:x)` ... 後方参照しないグループ化
	* 正規表現をグループ化しますが, `()`の中のパターンにマッチした文字列は記憶されません.

## メタ文字(2) 使い方
	my $str = 'perl is good!';
	if($str =~ /(?:perl|ruby|python) is (good|bad)!/) {
		print "評価は $1 です!\n";
		# "評価は good です!"と表示される.
	}

* `perl`, `ruby`, `python`を`|`でつなぎ, `(`と`)`で囲うことで, 選択一致をグループ化しています.
* 更に, `(?:`とすることで, 後方参照しないようにしています.
	* その為, $1は`(good|bad)`のパターンにマッチした文字列となります.

## 正規表現のメタ文字(3)
	my $str = 'john is dead.';
	print "john\n" if $str =~ /dead./;
	print "john\n" if $str =~ /dead\./;

* `\` ... メタ文字を無効化する
	* 正規表現の中で特殊な意味を持つ文字(例えば`/`や`.`など)を無効化します.
* この場合. `$str =~ /dead./`は, `john is dead!`などでもマッチしてしまう(`.`は任意の1文字とマッチ, なので).
* `\.`のようにすれば `.`そのものとのマッチができます.

## 練習問題B(10分)

* 練習問題Aを改変して, 入力した文字列に`john`ないし`John`が含まれる場合のみ, 文字列を出力しないように書き換えてみよう.

## アンカー(1)
* アンカーは, 行頭や行末など, 文字列の特定の位置とマッチします.
* `^` ... 行頭
* `\A` ... 最初の文字列
	* `^`と`\A`はよく似ていますが, 複数の行がある文字列に正規表現を行った場合, 挙動が異なります.
	* `^`は改行の直後(新しい行の行頭)にもマッチしますが, `\A`は文字列そのものの先頭にしかマッチしません.

## アンカー(2)
* `$` ... 行末
* `\Z` ... 最後の文字列
	* `$`は改行の直前にもマッチしますが, `\A`は文字列そのものの最後にしかマッチしません.
	* `^`と`\A`の関係と似ています.

## アンカー 使い方
	my $str = 'john is great';
	# 行頭に'john'がある場合のみマッチ
	print "マッチ!\n" if $str =~ /^john/;
	# 行末に'great'がある場合のみマッチ
	print "マッチ!\n" if $str =~ /great$/;

## アンカー(3)

* `\b` ... 文字の区切り
	* ここでの文字は, 英数字とアンダーバーを指します.
	* `\b`は, `\w`と`\W`の間とマッチします.
* `\B` ... 文字の区切り以外

## アンカー 使い方
	my $str = 'lyrical magical';
	print "マッチ!\n" if $str =~ /lyrical\b/;
	# マッチします.
	my $str2 = 'lyricalmagical';
	print "マッチ!\n" if $str2 =~ /lyrical\b/;
	# マッチしません.

* `lyricalmagical`は, `lyrical`の後に文字の区切りが存在しないので, 2つ目の正規表現はマッチしません.

## 練習問題C(10分)

* 練習問題Bを改変して, 以下の場合のみ, 文字列を出力しないように書き換えてみよう.
	* 文字列が`john`, `John`を含む.
	* 文字列の先頭に`betty`, `Betty`を含む.
	* 文字列の最後に`great`, `Great`を含む.

## マッチングの否定
	my $str = 'john betty beth';
	print "マッチ!\n" if $str !~ /beth/;
	# 何も表示されない.

* `!~`演算子は`=~`演算子の否定です.
* よって, 正規表現とマッチした場合は偽, 正規表現とマッチしない場合は真となります.
	* この場合, 文字列に`beth`を含まない場合, 真となって文字列が出力されます.

## 区切り記号の変更(1)
	my $str = '/usr/local/bin/perl';
	print "マッチ!\n" if $str =~ m|bin/perl|;

* 正規表現は`/`で区切りますが, `/`だと不都合な場合も多いです(例えば, URLを表記する場合など. 全ての`/`をエスケープする必要がある).
* そこで, `m//`のように, 先頭に`m`を付けると, 任意の記号のペアを区切り記号として利用することができます.
* この場合, `|`を区切り記号にしています. よって, `/`をエスケープする必要はありません.

## 区切り記号の変更(2)
	my $str = '/usr/local/bin/perl';
	$str =~ s|/usr/local/bin/|/usr/bin/|;

* 置換の場合, このようにできます.

## 正規表現のオプション
* 正規表現では, `//`の後にオプションを与えることができます.

## 繰り返してマッチ(g)
	my $str = 'Hello, hoge! Hello, fuga!';
	my @name = ($str =~ /Hello, (\w+?)!/g);
	# @name = ('hoge', 'fuga'); となる.

* `g`は, 正規表現のマッチングを繰り返し行います.
* また, 正規表現に`()`が含まれる場合, マッチした文字列のうち`()`の中に含まれる文字列をリストとして返します.

## 繰り返してマッチ(g)
	my $str = 'Hello, hoge! Hello, fuga!';
	my $str =~ s/Hello/Good morning/g;

* 置換の部分で説明したように, `s///g`とすると, 置換の処理を繰り返し行なってくれます.

## 大文字/小文字を区別しない(i)
	my $str = 'John and Beth';
	pritn "マッチ!\n" if $str =~ /john/i;

* `i`は, 正規表現中のアルファベットの大文字･小文字を区別せずにマッチングを行います.
* よって, `/john/i`は, `john`はもちろん, `John`や`JOHN`, `jOhN`などにもマッチします.

<!-- data-scale="0.5" -->

## 練習問題D(10分)

* 練習問題Cを改変して, 以下の場合のみ, 文字列を出力しないように書き換えてみよう.
	* 文字列が`john`, `John`を含む.
	* 文字列の先頭に`betty`, `Betty`を含む.
	* 文字列の最後に`great`, `Great`を含む.
	* 文字列が`tom`というアルファベットを含む(大文字･小文字問わず).
* また, 出力される文字列に`papix`が含まれる場合, 全て`hoge`に書き換えてから出力するようにしてみよう.

## 質問タイム
<!-- data-scale="0.5" -->

## 最終問題1 (20分~)
	ジュース:100円
	弁当:300円
	漫画:400円
	カップ麺:250円
	お菓子:100円

* このようなテキストを含む`price.txt`を読み込み, 左側の商品名をキーとして, 右側の価格を値を持つハッシュ`%price`を作りましょう.
* 商品名と価格の間は, `:`で仕切られてるとします.

## 最終問題2 (20分~)

* 先程の`price.txt`の価格を1.05倍(消費税を加算)したテキストを, `price+.txt`に書き出すようにしてみましょう.

## 質問タイム
<!-- data-scale="0.5" -->

## お疲れさまでした
<!-- data-scale="0.2" -->