# ながのCAKE

![Free_Sample_By_Wix (7).jpeg]

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発です。  

##案件の背景.    
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになりました。   
InstagramのDMやメールで通販の注文を受けていましたが、情報管理が煩雑になってきたため、  
管理機能を含んだ通販サイトを開設しようと思い至りました。  

##通販について.   
*通販では注文に応じて製作する受注生産型としています。    
*現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けていません。  
*送料は1配送につき全国一律800円。   
*本来は軽減税率により宅配物は税率8%ですが、今回は10%で統一します。    
*友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できます。    
*支払方法はクレジットカード、銀行振込から選択できます。    

##用語の定義.    
###顧客.   
*ながのCAKEの商品を購入する人（客）. 

###会員.  
*ECサイトにユーザー登録している顧客.   

###ECサイト.  
*顧客が利用するサイト. 

###管理サイト.   
*店で働く事務員・パティシエ等が利用するサイト（顧客管理サイト）. 

###ステータス.   
*注文や製作の状況を表している値（後述）。「受注ステータス」「製作ステータス」「退会ステータス」「販売ステータス」があります（後述）.   

#実装機能/使用方法.   

##Customer(顧客・会員).   

*顧客はログイン・ログアウト・退会ができます.   
*会員のログインはメールアドレスとパスワードで行います.   
*ログイン後はヘッダーに会員の名前が表示され、ログインできているかどうかが分かるようになっています.   
*サイトの閲覧は会員登録なしでも可能です.   
*商品をカートに入れ、1度に複数種類、複数商品の購入ができます。また、カート内の商品は個数変更・削除ができます.   
*カートへの商品追加および購入を行うには、会員登録が必要です.   
*会員はマイページからユーザ情報の閲覧・編集、注文履歴の閲覧、配送先の閲覧・編集ができます.   
*注文履歴には購入履歴ごとに下記の情報が表示されます.  
  購入日.   
  購入内容(商品名、個数、金額など).   
  購入価格総計.   
  送付先.   
  ステータス(入金待ち/入金確認/製作中/発送準備中/発送済み).   
*会員登録時、下記の情報をユーザ情報として入力できます.   
  名前(姓・名).   
  名前(カナ姓・カナ名).   
  郵便番号.   
  住所.   
  電話番号.   
  メールアドレス.   
  パスワード.   
*商品は主に税込価格で表示されます.   

##Admin（管理者側）. 

*管理者用メールアドレスとパスワードでログインできます.   
*商品の新規追加、編集、販売ステータスの変更が行えます.   
*商品情報は下記のものを持っています.   
  商品名.   
  商品説明文.   
  ジャンル.   
  税込/税抜価格.   
  商品画像.  
  販売ステータス(販売中/販売停止中).   
*会員登録されている利用者情報の閲覧、編集、退会処理が行えます.   
*ユーザの注文履歴が一覧・詳細表示できます.   
*注文履歴には注文ごとに下記の情報が表示されます.   
  購入者.   
  購入日.   
  購入内容.   
  請求額合計.   
  送付先.   
  受注ステータス(入金待ち/入金確認/製作中/発送準備中/発送済み).   
  製作ステータス(製作不可/製作待ち/製作中/製作完了).   
*注文ステータス、製作ステータスの更新ができます.   

##使用言語.   
*HTML&CSS.   
*Ruby.   
*JavaScript.   
*フレームワーク.   
  Ruby on rails (6.1.6.1).   

##作成者.   
*松本郁









<!--This README would normally document whatever steps are necessary to get the-->
<!--application up and running.-->

<!--Things you may want to cover:-->

<!--* Ruby version-->

<!--* System dependencies-->

<!--* Configuration-->

<!--* Database creation-->

<!--* Database initialization-->

<!--* How to run the test suite-->

<!--* Services (job queues, cache servers, search engines, etc.)-->

<!--* Deployment instructions-->

<!--* ...-->
