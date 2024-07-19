# 関数を使ってエラー処理
handle_error() {
    local exit_code=$?
    echo "Error: $1" >&2
    exit $exit_code
}
