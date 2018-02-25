#もしデスクトップ上に「日付_ユーザ名.txt」ファイルが存在するならば何もしません。
#もしデスクトップ上に「日付_ユーザ名.txt」ファイルが存在しないならばログファイルを作成します。

#変数を設定します。
$date = get-date -Format "yyyyMMdd"
$path = "C:\Users\$env:USERNAME\Desktop"
$result = (Test-Path "$path\$date`_$env:USERNAME.txt")

#条件分岐します。
if($result) {
    #ファイルが存在する場合はこちらが実行されます。
    Write-Host "ファイルが存在するのでなにもしません。"

    Read-Host "続けるには Enter キーを押してください..."
    exit
} else {
    #ファイルが存在しない場合はこちらが実行されます。
    Write-Host "ファイルが存在しないのでログを作成します。"

    write-output TEST > $path\$date`_$env:USERNAME.txt

    Read-Host "続けるには Enter キーを押してください..."
    exit
} 