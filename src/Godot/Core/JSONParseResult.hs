{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JSONParseResult
       (Godot.Core.JSONParseResult.get_error,
        Godot.Core.JSONParseResult.get_error_line,
        Godot.Core.JSONParseResult.get_error_string,
        Godot.Core.JSONParseResult.get_result,
        Godot.Core.JSONParseResult.set_error,
        Godot.Core.JSONParseResult.set_error_line,
        Godot.Core.JSONParseResult.set_error_string,
        Godot.Core.JSONParseResult.set_result)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

instance NodeProperty JSONParseResult "error" Int 'False where
        nodeProperty = (get_error, wrapDroppingSetter set_error, Nothing)

instance NodeProperty JSONParseResult "error_line" Int 'False where
        nodeProperty
          = (get_error_line, wrapDroppingSetter set_error_line, Nothing)

instance NodeProperty JSONParseResult "error_string" GodotString
           'False
         where
        nodeProperty
          = (get_error_string, wrapDroppingSetter set_error_string, Nothing)

instance NodeProperty JSONParseResult "result" GodotVariant 'False
         where
        nodeProperty = (get_result, wrapDroppingSetter set_result, Nothing)

{-# NOINLINE bindJSONParseResult_get_error #-}

bindJSONParseResult_get_error :: MethodBind
bindJSONParseResult_get_error
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_error ::
            (JSONParseResult :< cls, Object :< cls) => cls -> IO Int
get_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "get_error" '[] (IO Int) where
        nodeMethod = Godot.Core.JSONParseResult.get_error

{-# NOINLINE bindJSONParseResult_get_error_line #-}

bindJSONParseResult_get_error_line :: MethodBind
bindJSONParseResult_get_error_line
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_error_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_error_line ::
                 (JSONParseResult :< cls, Object :< cls) => cls -> IO Int
get_error_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_error_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "get_error_line" '[] (IO Int)
         where
        nodeMethod = Godot.Core.JSONParseResult.get_error_line

{-# NOINLINE bindJSONParseResult_get_error_string #-}

bindJSONParseResult_get_error_string :: MethodBind
bindJSONParseResult_get_error_string
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_error_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_error_string ::
                   (JSONParseResult :< cls, Object :< cls) => cls -> IO GodotString
get_error_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_error_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "get_error_string" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.JSONParseResult.get_error_string

{-# NOINLINE bindJSONParseResult_get_result #-}

bindJSONParseResult_get_result :: MethodBind
bindJSONParseResult_get_result
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_result" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result ::
             (JSONParseResult :< cls, Object :< cls) => cls -> IO GodotVariant
get_result cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_result (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "get_result" '[]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.JSONParseResult.get_result

{-# NOINLINE bindJSONParseResult_set_error #-}

bindJSONParseResult_set_error :: MethodBind
bindJSONParseResult_set_error
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_error ::
            (JSONParseResult :< cls, Object :< cls) => cls -> Int -> IO ()
set_error cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "set_error" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.JSONParseResult.set_error

{-# NOINLINE bindJSONParseResult_set_error_line #-}

bindJSONParseResult_set_error_line :: MethodBind
bindJSONParseResult_set_error_line
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_error_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_error_line ::
                 (JSONParseResult :< cls, Object :< cls) => cls -> Int -> IO ()
set_error_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_error_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "set_error_line" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.JSONParseResult.set_error_line

{-# NOINLINE bindJSONParseResult_set_error_string #-}

bindJSONParseResult_set_error_string :: MethodBind
bindJSONParseResult_set_error_string
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_error_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_error_string ::
                   (JSONParseResult :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
set_error_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_error_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "set_error_string"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.JSONParseResult.set_error_string

{-# NOINLINE bindJSONParseResult_set_result #-}

bindJSONParseResult_set_result :: MethodBind
bindJSONParseResult_set_result
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_result" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_result ::
             (JSONParseResult :< cls, Object :< cls) =>
             cls -> GodotVariant -> IO ()
set_result cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_result (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONParseResult "set_result" '[GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.JSONParseResult.set_result