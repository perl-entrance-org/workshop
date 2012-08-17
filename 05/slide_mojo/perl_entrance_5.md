# ![Perl入学式](/images/perl-entrance_t.png)
<!-- data-scale="0.5" -->

# Perl入学式 #5

<http://www.perl-entrance.org>

* 日時
    * 2012年5月27日（日） 14:00 - 17:00
* 会場
    * 株式会社Joe'sウェブホスティング
    * <http://www.joeswebhosting.net>

## Perl入学式について

* Perl入学式（<http://www.perl-entrance.org>）は、プログラミング未経験者からPerl初心者を対象としたワークショップです
* 公式Twitter
    * [@Perl_Entrance](http://twitter.com/perl_entrance)
* 公式ハッシュタグ
    * \#Perl入学式
* 公式Facebookページ
    * <https://www.facebook.com/PerlEntrance>

## 会場について

* 今回のPerl入学式は「Joe'sオープンソースJelly」の一環ということで、株式会社Joe'sウェブホスティング（<http://www.joeswebhosting.net>）様より特別に会場をお借りしています
* この場をお借りしてお礼申し上げます

## ロゴについて

![Perl入学式](/images/perl-entrance_t_300.png)

* 横山陽平さん（<http://yokoyamayohei.com/>）にデザインしていただきました
* この場をお借りしてお礼申し上げます

## IT勉強会スタンプラリー

![IT勉強会スタンプラリー](/images/it-stamp.png)

* Perl入学式は、IT勉強会スタンプラリー（<http://it-stamp.jp/>）に参加しています
* 今回のPerl入学式は、スタンプラリーの対象となる勉強会です
* 台紙は勉強会終了後にお渡しします

## 喋ってる人

* 名前 ： 若林 信敬
* Twitter ： [@nqounet](http://twitter.com/nqounet)
* Facebook ： [nobutaka.wakabayashi](https://www.facebook.com/nobutaka.wakabayashi)
* 仕事 ： フリーエンジニア（IT系）
* 屋号 ： [IT Office 西宮原](http://www.nishimiyahara.net)

## 本日の内容

* お約束
* 前回までのおさらい
* コマンドラインからPerlスクリプトを使おう
* ファイルを使おう
* 外部コマンド（シェル）を使おう
* 関数（サブルーチン）を使おう
* コンテキストを使いこなそう

## お約束

    #!/usr/bin/env perl
    use utf8;
    use strict;
    use warnings;
    
    binmode STDIN,  ":encoding(UTF-8)"; # 標準入力
    binmode STDOUT, ":utf8";            # 標準出力
    binmode STDERR, ":utf8";            # 標準エラー出力

<http://blog.nishimiyahara.net/2012/04/perl.html>

## 前回までのおさらい
<!-- data-scale="0.5" -->
### Q.画面に文字を出力する
**制限時間 ： 15秒**

* ターミナルに以下の文字列を表示するプログラムを（脳内で）作成してください。

> Hello World[改行]

### A.画面に文字を出力する

    #!/usr/bin/env perl
    use utf8;
    use strict;
    use warnings;
    
    binmode STDIN,  ":encoding(UTF-8)";
    binmode STDOUT, ":utf8";
    binmode STDERR, ":utf8";

    print "Hello World\n";

* 画面に出力するときは `print` を使います。
* 改行は`\n`で表示できます。

### Q.画面に日本語を出力する
**制限時間 ： 15秒**

* ターミナルに以下の文字列を表示するプログラムを（脳内で）作成してください。

> ハローワールド[改行]

### A.画面に日本語を出力する
    #!/usr/bin/env perl
    use utf8;
    use strict;
    use warnings;
    
    binmode STDIN,  ":encoding(UTF-8)";
    binmode STDOUT, ":utf8";
    binmode STDERR, ":utf8";

    print "ハローワールド\n";

* お約束を書いておけば日本語なども正しく出力できます。
### Q.画面から入力する
**制限時間 ： 15秒**

* 画面から1つの値を入力し、その値をターミナルに出力するプログラムを（脳内で）作成してください。

### A.画面から入力する
この解答例以降、お約束は省略します。

    print "値を入力してください>>>";
    my $input = <STDIN>;
    chomp($input);
    print "入力は $input です\n";

* 変数の宣言は`my`を使います。
* スカラー変数は先頭に`$`を付けます。
* ターミナル画面から入力を待つには`<STDIN>`を使います。
* ターミナルの入力には`[改行]`が付いてくるので、`chomp`で取り除きます。

### Q.四則演算
**制限時間 ： 15秒**

* 画面から2つの値を入力して、その2つを加減乗除した結果をそれぞれターミナルに出力するプログラムを（脳内で）作成してください。

### A.四則演算
    print "値1を入力してください>>>";
    chomp(my $input1 = <STDIN>);
    print "値2を入力してください>>>";
    chomp(my $input2 = <STDIN>);
    print "$input1 + $input2 = ", $input1 + $input2, "\n";
    print "$input1 - $input2 = ", $input1 - $input2, "\n";
    print "$input1 * $input2 = ", $input1 * $input2, "\n";
    print "$input1 / $input2 = ", $input1 / $input2, "\n";

* 加減乗除は、それぞれ`+`、`-`、`*`、`/`で演算できます。
* print文では、`,`で区切ると連結して表示されます。

### Q.条件分岐（数値比較）
**制限時間 ： 15秒**

* 画面から2つの値を入力し、その2つが **数値** として等しいかどうかを比較して、その結果をターミナルに出力するプログラムを（脳内で）作成してください。

### A.条件分岐（数値比較）
    print "値1を入力してください>>>";
    chomp(my $input1 = <STDIN>);
    print "値2を入力してください>>>";
    chomp(my $input2 = <STDIN>);
    if ($input1 == $input2) {
      print "$input1 と $input2 は数値として等しい。\n";
    }
    else {
      print "$input1 と $input2 は数値として等しくない。\n";
    }

* 条件分岐を行うには`if ~ else ~`を使います。
* 数値として等しいかどうかを評価するには`==`を使います。

#### 数値として比較（関係演算子一覧）

    my $x = 123;
    my $y = 123;
    if ( $x == $y ) { print "$x と $y は同じ\n";    }
    if ( $x != $y ) { print "$x と $y は違う\n";    }
    if ( $x >  $y ) { print "$x は $y より大きい\n"; }
    if ( $x <  $y ) { print "$x は $y より小さい\n"; }
    if ( $x >= $y ) { print "$x は $y 以上\n";      }
    if ( $x <= $y ) { print "$x は $y 以下\n";      }

#### 数値として比較（特殊）

    my $result = $x <=> $y;  # $x <=> $y の結果を代入
    if ( $result == 0 ) {    # 条件１
      print "$x と $y は同じ\n";
    }
    elsif ( $result < 0 ) {  # 条件２
      print "$x は $y より小さい\n";
    }
    else {                   # すべての条件に当てはまらない
      print "$x は $y より大きい\n";
    }

### Q.条件分岐（文字列比較）
**制限時間 ： 15秒**

* 画面から2つの値を入力し、その2つが **文字列** として等しいかどうかを比較して、その結果をターミナルに出力するプログラムを（脳内で）作成してください。

### A.条件分岐（文字列比較）
    print "値1を入力してください>>>";
    chomp(my $input1 = <STDIN>);
    print "値2を入力してください>>>";
    chomp(my $input2 = <STDIN>);
    if ($input1 eq $input2) {
      print "$input1 と $input2 は文字列として等しい。\n";
    }
    else {
      print "$input1 と $input2 は文字列として等しくない。\n";
    }

* 文字列として等しいかどうかを評価するには`eq`を使います。

#### 文字列として比較（関係演算子一覧）

    my $x = 'xyz';
    my $y = 'xyz';
    if ( $x eq $y ) { print "$x と $y は同じ\n";    }
    if ( $x ne $y ) { print "$x と $y は違う\n";    }
    if ( $x gt $y ) { print "$x は $y より大きい\n"; }
    if ( $x lt $y ) { print "$x は $y より小さい\n"; }
    if ( $x ge $y ) { print "$x は $y 以上\n";      }
    if ( $x le $y ) { print "$x は $y 以下\n";      }

#### 文字列として比較（特殊）

    my $result = $x cmp $y;   # $x cmp $y の結果を代入
    if ( $result == 0 ) {     # 条件１
      print "$x と $y は同じ\n";
    }
    elsif ( $result < 0 ) {   # 条件２
      print "$x は $y より小さい\n";
    }
    else {                    # すべての条件に当てはまらない
      print "$x は $y より大きい\n";
    }

### Q.条件分岐（上級）
**制限時間 ： 15秒**

* 画面から2つの値を入力し、その2つが **数値** として等しく、かつ、 **文字列** としても等しいかどうかを比較して、その結果をターミナルに出力するプログラムを（脳内で）作成してください。

### A.条件分岐（上級）
    print "値1を入力してください>>>";
    chomp(my $input1 = <STDIN>);
    print "値2を入力してください>>>";
    chomp(my $input2 = <STDIN>);
    if ($input1 == $input2 && $input1 eq $input2) {
      print "$input1 と $input2 は数値として等しく、かつ、文字列として等しい。\n";
    }
    else {
      print "$input1 と $input2 は数値として等しくないか、文字列として等しくない。\n";
    }

* 複数の条件に合致しているかを比較するには`&&`を使います。

#### 論理演算子一覧

    my $x = 1;
    my $y = 2;
    if ( $x == 1 && $y == 2 ) {
      print "$x は 1 かつ $y は 2 です\n";
    }
    if ( $x == 2 || $y == 2 ) {
      print "$x は 2 または $y は 2 です\n";
    }
    if ( ! $y == 1 ) {
      print "$y は 1 ではありません\n";
    }

### Q.配列
**制限時間 ： 15秒**

* 3つの値が入った配列を定義し、その最初の値と最後の値を表示するプログラムを（脳内で）作成してください。

### A.配列
    my @array = ("最初", "真ん中", "最後");
    print "$array[0]\n";
    print "$array[-1]\n";

* 配列全体は名前の先頭に`@`を付けます。
* 配列はスカラー値を複数個持つことが出来ます。
* 配列内のスカラー値を出力する時には、スカラー値を示す`$`と`[]`を用います。
* ブラケットには配列内の順序を示す添字（0が最初）を書きます。
* 添字が負の数の場合、最後の要素からカウントされます。

#### 配列の操作（No.1/2）

    my @empty_array = (); # 空の配列
    my @defined_only;     # 宣言のみ
    my @array = ('a', 'b', 'c');
    push(@array, '最後');      # 最後の要素に加える
    unshift(@array, '最初');   # 最初の要素に加える
    print "@array\n";         # 最初 a b c 最後[改行]
    my $pop   = pop(@array);  # 最後の要素を取り出す
    my $shift = shift(@array); # 最初の要素を取り出す
    print "@array\n";         # a b c[改行]
    print "$pop\n";           # 最後[改行]
    print "$shift\n";         # 最初[改行]

#### 配列の操作（No.2/2）

    my @array = ('a', 'b', 'c');
    my @array2 = reverse(@array);  # 要素を逆並びにする
    print "@array2\n";             # c b a[改行]
    my @array3 = sort(@array2);    # 要素を順序良く並べる
    print "@array3\n";             # a b c[改行]
    my $str = join(":", @array);   # 要素を連結する
    print "$str\n";                # a:b:c[改行]
    my @array4 = split(/:/, $str); # 文字列を分割する
    print "@array4\n";             # a b c[改行]

### Q.ハッシュ（連想配列）
**制限時間 ： 15秒**

* 二組の値が入ったハッシュを定義し、それぞれの値を表示するプログラムを（脳内で）作成してください。

### A.ハッシュ（連想配列）
    my %hash = (
      key1 => "value1",
      key2 => "値2",
    );
    print "$hash{key1}\n";
    print "$hash{key2}\n";

* ハッシュ全体は名前の先頭に`%`を付けます。
* ハッシュはキーに対するスカラー値を持つことが出来ます。
* `=>`はファットカンマといい、`,`とほぼ同じ意味があります。
* ハッシュ内のスカラー値を出力する時には、スカラー値を示す`$`と`{}`を用います。
* ブレースにはスカラー値に対応するキーを書きます。
### Q.繰り返し（for文）
**制限時間 ： 15秒**

1から10までの数値を持つ配列を作成し、すべての値を合計して表示するプログラムを（脳内で）作成してください。

### A.繰り返し（for文）
    my @array = (1 .. 10);
    my $sum = 0;
    for my $item (@array) {
      $sum += $item;
    }
    print "1から10の合計は${sum}です。\n";

* `for`を使うと、（配列のような）複数のスカラー値に対して同じ処理を実行することが出来ます。

### Q.繰り返し（ループ制御）
**制限時間 ： 15秒**

* 1から4と6から10までの数値を全て合計して表示するプログラムを（脳内で）作成してください。

### A.繰り返し（ループ制御）
    my @array = (1 .. 10);
    my $sum = 0;
    for my $item (@array) {
      if ($item == 5) {
        next;
      }
      $sum += $item;
    }
    print "1から4と6から10の合計は${sum}です。\n";

* 繰り返しの最中に`next`があると、その回はブロックの最後までの処理を飛ばします。この例では、`$item`が5の場合、`$sum += $item`の処理を飛ばします。
### Q.繰り返し（while文）
**制限時間 ： 15秒**

* 画面から文字列を入力（改行しか入力されていない場合はエラー表示）し、5つ入力されたらターミナルに出力するプログラムを（脳内で）作成してください。

### A.繰り返し（while文）
    my @array;
    while (@array < 5) {
      print "文字列を入力してください>>>";
      chomp(my $input = <STDIN>);
      if ( $input ne "" ) {
        push @array, $input;
      }
      else {
        print "ちゃんと文字列を入力してください。\n";
      }
    }
    print "入力されたのは@{array}です。\n";

* `while`は、条件式が真の間はブロックの中を繰り返し実行します。
### Q.パターンマッチ
**制限時間 ： 15秒**

* 画面から文字列を入力して、その文字列に"y"が含まれているかどうかを判定して、結果をターミナルに出力するプログラムを（脳内で）作成してください。

### A.パターンマッチ
    print qq{"y"を含んだ文字列を入力してください>>>};
    chomp(my $input = <STDIN>);
    if ($input =~ /y/) {
      print qq{${input}には"y"が含まれています。\n};
    }
    else {
      print qq{${input}には"y"が含まれていません。\n};
    }

* パターンマッチングを行うには`/PATTERN/`を`=~`で評価します。

#### パターンマッチ（正規表現）
    my $str = 'Yes';
    if ( $str =~ /[yY]/ ) { # [...]の中身のいずれか1文字にマッチ
      print "$str には「y」または「Y」が含まれています\n";
    }
    if ( $str =~ /y/i ) { # iオプションは大文字小文字を無視してマッチ
      print "$str には「y」または「Y」が含まれています\n";
    }

### Q.リファレンス
**制限時間 ： 15秒**

* ハッシュのリファレンスを値に持つ配列を作成して、その配列をターミナルに出力するプログラムを（脳内で）作成してください。

### A.リファレンス
    use Data::Dumper::Concise;
    my %hash1 = (
      key1 => "value1",
      key2 => "value2",
    );
    my %hash2 = (
      key1 => "値一",
      key2 => "値二",
    );
    my @array = ( \%hash1, \%hash2 );
    print Dumper \@array;

* リファレンスを作成するには配列やハッシュ等に対して`\`を使用します。

#### 様々なリファレンス

    my $scalar = 'string';
    my @array  = ('a', 'b', 'c');
    my %hash   = (key1 => 'value1', key2 => 'value2');
    my $scalar_ref = \$scalar; # スカラーのリファレンス
    my $array_ref  = \@array;  # 配列のリファレンス
    my $hash_ref   = \%hash;   # ハッシュのリファレンス
    my $scalar_ref_direct = \'Perl';
    my $array_ref_direct  = +['d', 'e', 'f'];
                            # 「+」は省略可能
    my $hash_ref_direct   = +{ key => 'value' };
                            # 「+」は省略可能

### Q.デリファレンス
**制限時間 ： 15秒**

* 以下のようなリファレンスがあった時、"perl"をターミナルに出力するプログラムを（脳内で）作成してください。

リファレンスの定義

    my $ref = {
      key1 => ["perl", "python", "php"],
      key2 => ["ruby"],
    }

### A.デリファレンス
    my $ref = {
      key1 => ["perl", "python", "php"],
      key2 => ["ruby"],
    };
    print $ref->{key1}->[0], "\n";
    print $ref->{key1}[0],   "\n";
    print ${$ref}{key1}[0],  "\n";

* リファレンスされた配列やハッシュを利用するには、デリファレンスする必要があります。
* これらは全て`perl`を表示します。

#### 様々なデリファレンス（配列）
    my @array     = ('a', 'b', 'c');
    my $array_ref = \@array;        # 配列のリファレンス
    print join("\n", @{$array_ref}); # 配列全体をデリファレンス
    print "\n";
    print "$array_ref->[0]\n";  # 配列のリファレンスの最初の要素
    print "$array_ref->[1]\n";  # 配列のリファレンスの2つめの要素
    print "$array_ref->[-1]\n"; # 配列のリファレンスの最後の要素

* 配列のリファレンスをデリファレンスするには、リファレンスを`@{...}`で囲います
* 配列のリファレンス内の一つの要素をデリファレンスする場合は`->`を使います

#### 様々なデリファレンス（ハッシュ）

    my %hash = ( key1 => 'value1', key2 => 'value2' );
    my $hash_ref = \%hash;
        # ハッシュのリファレンスを作成
    for my $key ( keys %{$hash_ref} ) {
        # ハッシュ全体をデリファレンス
      print "$key : $hash_ref->{$key}\n";
        # ハッシュの要素を表示する
    }

* ハッシュのリファレンスをデリファレンスするには、リファレンスを`%{...}`で囲います
* ハッシュのリファレンス内の一つの要素をデリファレンスする場合は`->`を使います

#### 変数（スカラー変数）のおさらい

    my $str = 'これは文字列です';
    my $num = 123;
    print "文字列（ $str ）と数値（ $num ）\n";

#### 配列の使い方のおさらい

    my @array = ('a', 'b', 'c');
    print "$array[0]\n";
    print "@{array}\n";
    for my $item ( @array ) {
      print "$item\n";
    }

#### 配列のリファレンス

    my $array_ref = +['a', 'b', 'c']; # 「+」は省略可能
    print "$array_ref->[0]\n";
    print "@{$array_ref}\n";
    for my $item ( @{$array_ref} ) {
      print "$item\n";
    }

#### ハッシュの使い方のおさらい

    my %hash  = (
      key1 => 'value1',
      key2 => 'value2',
    );
    print "key1 : $hash{key1}\n";
    for my $key ( keys %hash ) {
      print "$key : $hash{$key}\n";
    }

#### ハッシュのリファレンス

    my $hash_ref  = +{ # 「+」は省略可能
      key1 => 'value1',
      key2 => 'value2',
    };
    print "key1 : $hash_ref->{key1}\n";
    for my $key ( keys %{$hash_ref} ) {
      print "$key : $hash_ref->{$key}\n";
    }

## 休憩（15分）~ 15:25
<!-- data-scale="0.5" -->

## コマンドラインからPerlスクリプトを使おう
<!-- data-scale="0.5" -->

### \#!（シバン）とは

<blockquote cite="http://ja.wikipedia.org/wiki/%E3%82%B7%E3%83%90%E3%83%B3_(Unix)" title="シバン (Unix) - Wikipedia" class="blockquote"><p>シバンまたはシェバン (shebang) とはUNIXのスクリプトの#!から始まる1行目のこと。起動してスクリプトを読み込むインタプリタを指定する。 hash-bangまたはsharp-bangとも言うが、後者を縮めたshebangという呼び方が一般的かつシンプルである。</p></blockquote><div class="cite"><cite><a href="http://ja.wikipedia.org/wiki/%E3%82%B7%E3%83%90%E3%83%B3_(Unix)">シバン (Unix) - Wikipedia</a></cite></div>

### #!（シバン）を書かなかった場合

    $ perl scriptname.pl

* スクリプトファイルをperlの引数として実行します。

### #!（シバン）を書いた場合

    $ chmod +x scriptname.pl # 実行権限を与える
    $ ./scriptname.pl        # スクリプトファイルがコマンドのように使える

* `chmod`でスクリプトファイルに実行権限を与えると、スクリプトファイル単体で実行が可能になります。

### @ARGV（アットマーク・アーグヴィ）
scriptname.plの中身

    my @opts = @ARGV;
    print "@opts\n";

実行する時に引数を与える

    $ ./scriptname.pl a b c

* コマンドを実行する時に引数を与えると、`@ARGV`にその引数が入ります。

### コマンドラインの練習問題
**制限時間 ： 5分**

* 2つの値を渡して、その2つが **文字列** として等しいかどうかを比較して、その結果をターミナルに出力するプログラムを（実際に）作成してください。
* 完成したら`コマンドラインの練習問題できたー！ #Perl入学式`とツイートしよう！

## ファイルを使おう
<!-- data-scale="0.5" -->
### ファイルから読み込もう

    my $fh;
    open $fh, "<", "file1.txt"; # file1.txtを読み込みモードでオープン
    my @lines = <$fh>;          # @linesにファイルの内容を代入
    print @lines;               # 画面に出力する
    close $fh;                  # ファイルを閉じる

* ファイルを利用するときは`open`を使います。
* 書式は、`open ファイルハンドル, モード, ファイル名`
* 読み込むときは、モードを`<`にします。
* この例では、スクリプトファイルと同じ階層にある`file1.txt`というファイルを読み込んでいます。

### ファイルに書き込もう

    my $fh;
    my @array = ("a", "b", "c");
    open $fh, ">", "file2.txt";
    for my $item (@array) {
      print $fh "$item\n";       # $fh に対して出力する
    }
    close $fh;

* 書き込むときは、モードを`>`にします。
* ファイルがない場合は作成します。
* より詳細な解説 : <http://perldoc.jp/func/open>

### モード各種
* `<` : 読み込み
* `>` : 新しく書き込み
* `>>` : 追加書き込み
* `+<` : 読み込み（書き込みも可）
* `+>` : 新しく書き込み（読み込みも可）（あまり使わない）
* `+>>` : 追加書き込み（読み込みも可）（あまり使わない）

### ファイルの状態を確認しよう
<!-- data-scale="0.5" -->
#### -r（読み込み出来るかを確認）
    my $filename = "404.txt";
    if (-r $filename) {            # 404.txtが読み込み可能か確認
      open my $fh, "<", $filename; # 変数の宣言はopenと同時でも良い
      my @lines = <$fh>;
      print @lines;
      close $fh;
    }
    else {
      die qq{can not read "$filename"}; # ファイルが読み込みできないので異常終了
    }

#### -w（書き込み出来るかを確認）
    my @array = ("a", "b", "c");
    my $filename = "404.txt";
    if (-w $filename) {            # 404.txtが書き込み可能か確認
      open my $fh, ">", $filename; # 変数の宣言と同時でも良い
      for my $item (@array) {
        print $fh "$item\n";       # $fh に対して書き込み
      }
      close $fh;
    }
    else {
      die qq{can not write "$filename"}; # ファイルが書き込みできないので異常終了
    }

* より詳細な解説 : <http://perldoc.jp/func/-X>

### ファイルの練習問題
**制限時間 ： 5分**

* `perl_entrance5.txt`という名前のファイルに「perl_entrance5[改行]」と書き込むプログラムを（実際に）作成してください。
* ただし、既にファイルが存在している場合は、異常終了するようにしてください。
* 完成したら`ファイルの練習問題できたー！ #Perl入学式`とツイートしよう！

## 外部コマンド（シェル）を使おう
<!-- data-scale="0.5" -->
### exec
    exec("ls");
    print "OK\n"; # 実行されない

* `exec`に対して文字列を渡すと、その文字列をシェルのコマンドとして実行します。
* そして、そのまま終了します。
* つまり、`exec`の後に書いた命令は実行されません。

### system
    system("ls");
    print "OK\n"; # 実行される

* `system`に対して文字列を渡すと、その文字列をシェルのコマンドとして実行します。
* そして、実行が終わると処理が戻ってきます。

### ``(バッククォート)
    my @results = `ls`;
    print @results;

* 文字列を<code>``</code>でくくると、その文字列をシェルのコマンドとして実行し、その結果を返します。

### qx{}
    my @results = qx{ls};
    print @results;

* 文字列を`qx{...}`でくくると、その文字列をシェルのコマンドとして実行し、その結果を返します。
* <code>``</code>と同じです。

### 外部コマンドの練習問題
**制限時間 ： 5分**

* コマンドラインの練習問題で作ったプログラムを`exec`で呼び出してみよう。
* コマンドラインの練習問題で作ったプログラムを`system`で呼び出してみよう。
* コマンドラインの練習問題で作ったプログラムを<code>``</code>または<code>qx{...}</code>で呼び出して、実行結果をターミナルに出力してみよう。
* 完成したら`外部コマンドの練習問題できたー！ #Perl入学式`とツイートしよう！

## 関数（サブルーチン）を使おう
<!-- data-scale="0.5" -->
### サブルーチンとは？
<blockquote cite="http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%96%E3%83%AB%E3%83%BC%E3%83%81%E3%83%B3" title="サブルーチン - Wikipedia" class="blockquote"><p>サブルーチン（英: subroutine）は、コンピュータプログラミングにおいて、プログラム中で意味や内容がまとまっている作業をひとつの手続きとしたものである。ソースコード上ではコードブロックを形作る。繰り返し利用されるルーチン作業をモジュールとしてまとめたもので、呼び出す側の「主」となるもの（メインルーチン）と対比して「サブルーチン」と呼ばれる。サブプログラム (subprogram) とも呼ぶ。
</p></blockquote><div class="cite"><cite><a href="http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%96%E3%83%AB%E3%83%BC%E3%83%81%E3%83%B3">サブルーチン - Wikipedia</a></cite></div>

### 関数とは？
<blockquote cite="http://ja.wikipedia.org/wiki/%E9%96%A2%E6%95%B0_(%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0)" title="サブルーチン - Wikipedia" class="blockquote"><p>サブルーチンを、結果として値を返すものと処理だけを行い値を返さないものに分類することがある。その場合、前者を関数（かんすう）、後者を手続き（てつづき）と呼んで区別する。プログラミング言語の仕様としてCのようにどちらかの呼び方のみを採るものと、Pascal のように両者を区別するものがある。
</p></blockquote><div class="cite"><cite><a href="http://ja.wikipedia.org/wiki/%E9%96%A2%E6%95%B0_(%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0)">サブルーチン - Wikipedia</a></cite></div>

### Perlにおける関数
Perlでは「関数」は「サブルーチン」と同じです。

あえて区別するとすれば、値を返すサブルーチンを関数と呼んでもよいでしょう。

### 標準の関数を使ってみよう
    my $sin90 = sin(3.14159 / 2);
    print "$sin90\n";

* `sin`は三角関数のsinの値を返す関数です。
* 引数（パラメータ）には角度（ラジアン）を与えます。

### 関数を定義しよう
ラジアンの計算が面倒なので、度数法の角度を入力するとsinの値が返ってくる関数を定義します。

    my $sin90 = &decsin(90);
    print "$sin90\n";
    
    sub decsin {
      my $dec = shift(@_);
      my $sin = sin( $dec / 180 * 3.14159 );
      return $sin;
    }

#### 関数を定義する方法
* 関数（サブルーチン）を定義するには`sub`を使います。
* `sub sub_name {...}`とすると、`sub_name`という関数が定義できます。
* 使うときは、`&`に続けて名前を書きます。引数があれば`()`内に書いて渡します。
* サブルーチンに引数を渡すと、サブルーチンでは`@_`という配列に格納されます。
* `return`で値を返す事ができます。

### 関数の使い所
cosについても同様に関数を定義します。

    print &deccos(90), "\n"; # 直接printしてもOK
    
    sub deccos {
      my $dec = shift(@_);
      my $cos = cos( $dec / 180 * 3.14159 );
      return $cos;
    }

* `$dec / 180 * 3.14159`が重複しているのでどうにかしたいですね。

#### 処理をまとめる
    sub deccos {
      my $dec = shift(@_);
      my $cos = cos( &dec2rad($dec) );
      return $cos;
    }
    
    sub dec2rad {
      return $_[0] / 180 * 3.14159;
    }

* 関数から関数を呼び出すことも可能です。
* 関数の引数に関数を使うことも可能です。（実際には、計算された値が引数に使われます）
* `$_[0]`は`@_`の最初の要素、つまり、引数の最初の値を示します。
* `return`は計算された値も返すことが出来ます。

### 省略できる変数
<!-- data-scale="0.5" -->
#### @_（アットマーク・アンダーバー）

    my $sin90 = &decsin(90);
    print "$sin90\n";
    
    sub decsin {
      my $dec = shift; # @_が対象になる
      my $sin = sin( $dec / 180 * 3.14159 );
      return $sin;
    }

* サブルーチン内では、shiftやpopなどの配列を操作する関数で、対象となる配列を省略すると`@_`を対象にします。
（ちなみに、サブルーチン外では`@ARGV`が対象になります）

#### $_（ドルマーク・アンダーバー）
    my @array = ("a", "b", "c");
    for my $item (@array) {
      print "$item\n";
    }

これは、以下のようにしても動きます。

    my @array = ("a", "b", "c");
    for (@array) {
      print "$_\n";
    }

* `for`でループ用の変数を使わない場合、ループ変数として`$_`が使用されたとみなします。
* `$_`は`for`以外にも多く使われています。

### 関数の練習問題
**制限時間 ： 5分**

* 引数が2つの数値の加算を行う関数と、引数が2つの数値の減算を行う関数を作成し、それを利用して計算された結果をターミナルに出力するプログラムを作成してください。
* 完成したら`関数の練習問題できたー！ #Perl入学式`とツイートしよう！

## コンテキストを使いこなそう
<!-- data-scale="0.5" -->
### コンテキストとは？
コンテキスト（Context）とは、直訳すると「文脈」という意味です。

Perlには2つの主要なコンテキストがあります。

* スカラーコンテキスト（1個の物を扱う）
* リストコンテキスト（複数の物を扱う）

特に代入しようとする場合、このコンテキストによって得られる値が変化する場合があります。

### コンテキストを実感してみよう
    my @local_time = localtime;
    print "@local_time\n";
    
配列変数に代入しようとすると、`localtime`はリストコンテキストとして動作します。

    my $local_time = localtime;
    print "$local_time\n";

スカラー変数に代入しようとすると、`localtime`はスカラーコンテキストとして動作します。

* 実際に実行してみてください。

### リストコンテキスト
    my @array = ("a", "b", "c"); # リストコンテキスト
    
    my ($scalar1, $scalar2, $scalar3) = ("a", "b", "c"); # リストコンテキスト
    print "$scalar1\n";
    print "$scalar2\n";
    print "$scalar3\n";
    
    my ($scalar) = ("a", "b", "c"); # リストコンテキスト
    print "$scalar\n";

* 実際に実行してみてください。

### スカラーコンテキスト
    my @array = ("a", "b", "c"); # これはリストコンテキスト
    
    my $scalar = @array; # スカラーコンテキスト
    print "$scalar\n";
    
    my $scalar2 = ("a", "b", "c"); # スカラーコンテキスト
    print "$scalar2\n";

* 実際に実行してみてください。

### コンテキストをコントロールしよう
    my @list_lt = localtime;
    print "@list_lt\n";
    
    my @scalar_lt = scalar(localtime);
    print "@scalar_lt\n";

* `scalar`を使うと、強制的にスカラーコンテキストで評価されます。
* 実際に実行してみてください。

## 演習問題
<!-- data-scale="0.5" -->
### 問題
**制限時間 ： 10分**

* コマンドラインから`./script.pl 2 + 3`や、 `./script.pl 3 - 2`のようにすると、答えをターミナルに表示するプログラムを作成してください。
* `+`や`-`は、両側をスペースで区切って入力するものとします。
* 完成したら`演習問題できたー！ #Perl入学式`とツイートしよう！

## 質問タイム
<!-- data-scale="0.5" -->
## お疲れさまでした
<!-- data-scale="0.2" -->
