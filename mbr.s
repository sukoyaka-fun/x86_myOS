; 初期設定
mov si, 0x01BE  ; SIレジスタに最初のパーティションエントリのオフセットをロード
mov cx, 4       ; CXにパーティションエントリの数（4つ）を設定

CheckPartition: 
mov al, [si]    ; 現在のパーティションエントリの最初のバイト（ブートフラグ）をALレジスタにロード
cmp al, 0x80    ; ALの値が0x80（ブート可能フラグ）かどうかを比較
je BootPartition ; ブート可能なら、BootPartitionラベルにジャンプ

; 次のパーティションエントリに進む
add si, 16      ; SIレジスタを16バイト進めて次のパーティションエントリへ移動
loop CheckPartition ; CXをデクリメントし、0でないならCheckPartitionに戻る

; 全てのパーティションエントリを確認してもブート可能なものが見つからなかった場合
jmp NoBootablePartition ; エラー処理ラベルへジャンプ

BootPartition:
; ブート可能なパーティションが見つかった場合の処理
; (ここにコードを追加)

NoBootablePartition:
; ブート可能なパーティションが見つからなかった場合の処理
; (エラー表示やシステム停止などの処理を追加)
