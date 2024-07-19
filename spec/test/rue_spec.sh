Describe 'test_rue'
  Context '引数をつけない'
    It '指定したエラーメッセージが返る'
      When call rue
      The error should equal 'Error: Takes only one argument. Specify the file name.'
    End
  End

  Context '引数を2個つける'
    It '指定したエラーメッセージが返る'
      When call rue test.rs test.rs
      The error should equal 'Error: Takes only one argument. Specify the file name.'
    End
  End

  Context '.rbファイルを引数にする'
    rb_file=sample.rb
    It '指定したエラーメッセージが返る'
      When call rue $rb_file
      The error should equal "Error: Invalid file extension: $rb_file Expected .rs file"
    End
  End

  Context '.rsファイルを指定するが存在しない'
    rs_file=sample.rs
    absolute_path=$(realpath "$rs_file")
    It '指定したエラーメッセージが返る'
      When call rue $rs_file
      The error should equal "Error: File not found: $absolute_path"
    End
  End

  Context '存在する.rsファイルを実行する'
    It '正しく実行される'
      When call rue spec/sample/sample.rs
      The output should equal 'Hello, World!'
    End
  End
End
