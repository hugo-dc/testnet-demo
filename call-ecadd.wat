(module
  (import "ethereum" "callDataCopy" (func $callDataCopy (param i32 i32 i32)))
  (import "ethereum" "callCode" (func $callCode (param i64 i32 i32 i32 i32) (result i32)))
  (import "ethereum" "storageStore" (func $storageStore (param i32 i32)))
  (import "ethereum" "returnDataCopy" (func $returnDataCopy (param i32 i32 i32)))

  (memory 1)
  (data (i32.const 0) "\06")
  (export "main" (func $main))
  (export "memory" (memory 0))
  (func $main
    (call $callDataCopy
      (i32.const 52)
      (i32.const 0)
      (i32.const 128))

    (i32.store (i32.const 180)
      (call $callCode (i64.const 200000) (i32.const 0) (i32.const 20) (i32.const 52) (i32.const 128)))

    (call $returnDataCopy (i32.const 212) (i32.const 0) (i32.const 32))
    (call $storageStore (i32.const 244) (i32.const 212))))