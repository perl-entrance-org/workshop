# ![Perl入学式](/images/perl-entrance_t.png)
<!-- data-scale="0.5" -->

# Perl入学式 #6

<http://www.perl-entrance.org>

* 日時
    * 2012年7月1日（日） 14:00 - 17:00
* 会場
    * 株式会社Joe'sウェブホスティング
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

* 今回のPerl入学式は「Joe'sオープンソースJelly」の一環ということで, 株式会社Joe'sウェブホスティング(<http://www.joeswebhosting.net>)様より特別に会場をお借りしています
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

* 名前    : papix (ぱぴっくす)
* Twitter : [@\_\_papix\_\_](http://twitter.com/__papix__)
* 仕事    : 大学院生
* 一言    : 就職先超募集中!

## [YAPC::Asia](<http:/yapcasia.org/2012/>)に行こう!

* Yet Another Perl Conference
    * 日本最大級のPerlの祭典!
    * 9月27日から29日まで, 東京大学で開催

## Perl入学式も出ます!(予定)

* [Perl入学式をやってみた!](http://yapcasia.org/2012/talk/show/2c8dfc82-bd2b-11e1-a568-b39f6aeab6a4)
* よければ, "Like"ボタンや"イイネ!"ボタンなどを押してもらえると...(ry

## 本日の内容

* 復習問題とお約束
* サブルーチン再び
* for/whileの細かい操作
* 後置if/unless
* mapとgrep
* 最終問題

## 復習問題

**目標時間 : 30分**

* 端末から, 名前, 身長, 体重を入力しよう.
* ハッシュを使って, それらの情報を格納しよう.
* BMIを求める関数を作ろう.
    BMI = 体重 / (身長 * 身長)
* 入力したデータからBMIを計算して, ハッシュに格納しよう.
* 入力したデータを出力しよう.

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

## サブルーチン再び
* 前回紹介したサブルーチンを, より深く掘り下げていきます.
* 関数をもっと便利に, もっとスマートに使う為の方法を紹介します.

## 複数の引数を持つ関数

    sub add {
        my ($left, $right) = @_;
        return $left + $right;
    }

* 複数の引数を持つ関数は, このように書きます.
* これは複数のスカラ変数を引数としていますが, 複数の配列変数を引数とする場合はどうなるでしょうか.

## 複数の配列変数を持つ関数

	my @array_a = ('a', 'b', 'c');
	my @array_b = ('d', 'e', 'f', 'g');
	my @return = &merge(@array_a, @array_b);
	print @return;

    sub merge {
        my (@left, @right) = @_;
		return (@right, @left);
    }

* これは, 入力した2つの配列を逆順に結合する関数です.
    * この場合, `@return`の中身を`'d', 'e', 'f', 'g', 'a', 'b', 'c'`にしたい.
* 実際に実行してみましょう.

## 配列変数の問題

* おそらく, `abcdefg`と表示されたのではないでしょうか.
    * `@return`の中身が`'a', 'b', 'c', 'd', 'e', 'f', 'g'`となっている.
* ...どうして?
    * 原因を考えてみよう!

## 原因

* 配列の中に配列を格納すると, 配列は展開されます.
	* `@array_a = ('a');`, `@array_b = ('b')`のとき, `@array_c = (@array_a, @array_b)`は, `@array_c = ('a', 'b')`になります.
* 関数に渡した引数は, `@_`配列という配列に格納されます.
* よって, 関数mergeの引数を格納する2つの配列は, `@left = ('a', 'b', 'c', 'd', 'e', 'f', 'g')`, `@right = undef`となります.
* 引数は`@_`配列に格納される為, 引数となる2つの配列の区切りがわからなくなってしまう!

## しかも...

* このように, 配列を直接関数の引数として渡すと, Perlは配列のデータをコピーしてから処理を行います.
* 引数となる配列の要素が数個なら問題ないですが, 数百個, 数千個だと大きな負担となります.
	* どうすれば...!?

## ご安心下さい!

* ちゃんと解決策は用意されています. ...リファレンスを使いましょう!
* 関数に配列そのものを渡すのではなく, 配列のリファレンスを渡すようにすればいいのです.

## リファレンスを使おう
	
	my @array_a = ('a', 'b', 'c');
	my @array_b = ('d', 'e', 'f', 'g');
	my @return = &merge(\@array_a, \@array_b);
	print @return;

    sub merge {
        my ($left, $right) = @_;
		return (@$right, @$left);
    }

* 3行目, `&merge(\@array_a, \@array_b)`とすることで, 関数に対して配列のリファレンスを渡します.
* 7行目, 関数の中で配列のリファレンスを受け取ります. リファレンスはスカラ変数として受け取るので, `@left`ではなく`$left`とします.
* 8行目, リファレンスに`@`を付けることで, 配列として参照します.

## リファレンスを使おう

* 実行すれば, `defgabc`と表示されるはずです.
    * `@return`の中身が`'d', 'e', 'f', 'g', 'a', 'b', 'c'`になっています!
* リファレンスは, つまるところ｢この配列はここにあるよ｣という情報なので, 配列をそのまま渡すときのように, 配列のコピーは発生しません.
* 但し, 関数の中でリファレンスを使って配列の要素を変更した場合, 関数の外の元の配列にも影響が出ます.

## ...どういうこと?
	
	my @array = ('a', 'b', 'c');
	my @return = &add(\@array_a);
	print "return: " . (join ',', @return) . "\n";
	print "array : " . (join ',', @array) . "\n";

    sub add {
        my ($array) = @_;
		@$array = (@$array, 'd');
		return @$array;
    }

* 関数addは, 引数となった配列に最後の要素として`d`を加えて, その配列を返す関数です.
* 配列`@array`と`@return`の要素はどうなるでしょうか.
* 実際に実行してみましょう.

## どうなりましたか?

* `@return`も`@array`も, どちらも`a,b,c,d`と表示されたのではないでしょうか.
* これは, 8行目でリファレンスを使って配列を書き換えているのが原因です.
* 不慣れな時期によくあるミスですので, 気をつけましょう.

## ところで, ハッシュは?

* 関数の引数としてハッシュを渡したい場合も, 配列と同じようにリファレンスを使えば問題ありません.

## まとめ

* 配列やハッシュを関数の引数として渡したい場合は, リファレンスを使おう!
* 関数の中でリファレンスを使って配列やハッシュを書き換えると, 関数の外にある, 元の配列やリファレンスも操作されてしまうので, 気を付けよう!

## 引数の多い関数

	&subroutine(1, 'papix', '22', $year, $month, $day);
	
	sub subroutine {
		my ($id, $name, $age, $year, $month, $day) = @_;
	}

* このように関数の引数が多くなると, 1行目の引数の順番と, 4行目の引数の順番が対になるように気にしないといけません.
	* 引数を追加する時, ちょっと面倒です.

## 関数×ハッシュ
	&subroutine({ id => 1, name => 'papix', age => 22, year => $year, month => $month, day => $day});
	
	sub subroutine {
		my ($arg) = @_;

		print $arg->{id} . "\n";
	}

* このように, 関数の引数を無名ハッシュとして渡す方法があります.
	* ハッシュならば順番は関係なく, 固有のキーでアクセスできるので, 引数の順番を気にしなくても大丈夫です.

## 練習問題(10分)

	my $name = 'papix';
	my $twitter = '__papix__';
	my @mail = ('papix2011@gmail.com', 'hogehoge@fugafuga.com');

* 2つの変数と1つの配列を渡すと, その中身を表示するような関数を作って下さい.
* このような出力になればOKです.

	* name   : papix
	* twitter: \_\_papix\_\_
	* mail   : papix2011@gmail.com,hogehoge@fugafuga.com

## 休憩(10分)
<!-- data-scale="0.5" -->

## for/whileの細かな操作

* ...の前に, ちょっと復習!

## for文の使い方

	my $sum = 0;
	for my $num (1..10) {
		$sum += $num;
	}
	print "$num\n"; # 55

* for文は, カッコの中のリストの全ての要素に対して, 処理を繰り返します.
	* 例は, `(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)`というリストの全ての要素を$sumという変数に足し合わせることで, 1から10までの数の和を計算しています.

## while文の使い方

	my $sum = 0;
	while($sum <= 10) {
		$sum++;
	}
	print "$sum\n"; # 11

* while文は, カッコの中の条件が真である限り, 処理を繰り返します.

## 繰り返しの中止

	my @language = qw/ python ruby c perl haskell java /;
	my $find = 0;
	for my $lang (@language) {
		if($lang eq 'perl') {
			$find = 1;
		}
	}

* これは, ある配列(`@language`)に`perl`という文字列が含まれているかを確認するスクリプトです.
	* `perl`という文字列が含まれていれば, `$find`の値が1となり, そうでないならば0のままになります.
* このスクリプト, 効率が悪いと思いませんか?

## この場合...
* このスクリプトの場合, `perl`という文字列が見つかった後でも, 繰り返しの処理は終わりません.
* 素直に, `python`から`java`まで, 配列の全ての要素に対して`perl`と等しいかをチェックします.
* しかし, このスクリプトの目的は, `perl`という文字列を含むか否か, です.
	* ならば, `perl`という文字列を発見した時点で, 繰り返し処理を終了してもいいですよね?

## last

	my @language = qw/ python ruby c perl haskell java /
	my $find = 0;
	for my $lang (@language) {
		if($lang eq 'perl') {
			$find = 1;
			last;
		}
	}

* そのような場合に用いるのが, `last`です.
* 繰り返し処理の中で`last`が来ると, その時点で今行なっている繰り返し処理を中止します.

## 繰り返しのパス

	my @university = qw / kwansei kansai ritsumeikan doushisha /;
	for my $univ (@university) {
		print "$univ\n";
	}

* 繰り返し処理をする中で, ある条件を満たした場合のみ, 処理をしたくない, という場合があります.
	* これは`@university`に含まれる要素を全て出力するスクリプトですが, 要素が`kwansei`だった場合出力したくない, という場合を考えます.

## next

	my @university = qw / kwansei kansai ritsumeikan doushisha /;
	for my $univ (@university) {
		if($univ eq 'kwansei') { next; }
		print "$univ\n";
	}

* このように`next`を置くと, その時点でその繰り返しが終了し, 次の繰り返しへ遷移します.
	* この場合, `$univ`が`kwansei`と等しい場合, それ以降の処理を実行せず, 次の繰り返し(`kansai`)に移ります.

## 練習問題(10分)

* 0から99の文字を順番に出力します.
	* 但し, その数が3で割り切れるなら, ボケて(?)何も表示しません.
	* 1つ数字を表示するごとに, 0から99までの数字をランダムに生成して, 表示した値と一致したら'オモロー!'と表示して終了します.
	* 0から99までの乱数は, 次のようにして得ることができます. `int rand(100)`
	* 何故今更世界のナベアツなんだ...?

## 後置if/unless

* ...の前に, ちょっと復習!

## if文とunless文

	if($num == 100) {
		$num *= 100;
	}
	unless($num != 100) {
		$num++;
	}

* if文は, カッコの中の条件が真ならば処理を行います.
* unless文はif文と逆で, カッコの中の条件が偽ならば処理を行います.

## 後置if/unless

	$num *= 100 if($num == 100);
	$num++ unless($num != 100);

* if文やunless文は, このように後に置くこともできます.
* 注意すべき点は, 後に置いたifやunlessの前には, 1つの処理しか書けないということです.

## 無効な後置if/unless

	$num++; $num *= 10 if($num == 100);

* `$num`が100の場合, `$num++`をした後に, `$num *= 10`をさせたい, と思ってこのように書いても, そのように動作しません.
* この場合, `$num`の値に関わらず`$num++`が実行され, その後に`$num`が100の場合, `$num += 10`が実行されます.

## 便利な使い方

	my @university = qw / kwansei kansai ritsumeikan doushisha /;
	for my $univ (@university) {
		next if($univ eq 'kwansei');
		# if($univ eq 'kwansei') { next; }
		print "$univ\n";
	}

* 先程, `next`を紹介する際に使ったプログラムを, 後置ifを使って書きなおしてみました.
* こちらの方がスマートだと思いませんか?

## 練習問題(10分)

* 先程作った練習問題のスクリプトで後置if/unlessを使えそうな部分を, 後置if/unlessを使うように書き換えてみましょう.

## 質問タイム
<!-- data-scale="0.5" -->

## お疲れさまでした
<!-- data-scale="0.2" -->
