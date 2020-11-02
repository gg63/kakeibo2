#BooksContrololerにApplicationControllerを継承している
#ApplicationControllerという変数をBooksControllerに渡し定義している
class BooksController < ApplicationController
    #indexアクションを実行するための処理  
    def index
        #全ての家計簿データを@booksというインスタンス変数に値を格納している
        @books = Book.all
    end 
    #showアクションを実行するための処理
    def show
        #コントローラーの中ではparams[:id]で:idに入った値を受け取れる
        #findメソッドでparams[:id]と等しい:idを持つデータを検索している。見つかれば1件のみを取得する
        #単数系の変数@bookへ検索結果を代入する
        @book = Book.find(params[:id])
    end 
    #新規画面登録表示するための処理
    def new
        #@bookに空っぽのインスタンスを入れている
        @book = Book.new
        @book.year = 2019
    end 
    
    def create
        #paramsにはたくさんのデータが入っているので登録に必要なデータだけ取り出す処理を行っている
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        #Bookモデルを新しくインスタンス化し、book_paramsをつけることで新しくデータを入れている
        @book = Book.new(book_params)
        #データをデータベースに保存するための処理
        #ifで@book.saveが成功(true)の時はリダイレクトする
       if  @book.save
           #books_path（一覧画面）に移りなさいというリダイレクト命令をブラウザへ返却している
           #リダイレクトを利用することで登録完了したら自動的に一覧画面に戻れる
        redirect_to books_path
      else
          #renderはビューファイルを指示するメソッド
          #登録画面をもう一度表示したい時に登録画面を表示する指示をrenderメソッドを使って出す
        render :new
      end 
    end 
    #editアクションを実行する処理。登録したデータを更新する画面の処理
    def edit 
        @book = Book.find(params[:id])
    end 
    
    def update
        @book = Book.find(params[:id])
        
        book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
        if @book.update(book_params)
            #更新した家計簿の詳細画面へリダイレクトしている
            redirect_to books_path
        else
            #登録に失敗した場合renderメソッドによりedit.html.erbに画面に移る
           render :edit
        end 
    end 
    
    
end 