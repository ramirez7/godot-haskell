{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JSON
       (Godot.Core.JSON.parse, Godot.Core.JSON.print) where
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
import Godot.Core.Object()

{-# NOINLINE bindJSON_parse #-}

-- | Attempts to parse the @json_string@ provided.
--   				Returns an @enum Error@. If the parse was successful, it returns @OK@ and the result can be retrieved using @method get_data@. If unsuccessful, use @method get_error_line@ and @method get_error_message@ for identifying the source of the failure.
bindJSON_parse :: MethodBind
bindJSON_parse
  = unsafePerformIO $
      withCString "_JSON" $
        \ clsNamePtr ->
          withCString "parse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attempts to parse the @json_string@ provided.
--   				Returns an @enum Error@. If the parse was successful, it returns @OK@ and the result can be retrieved using @method get_data@. If unsuccessful, use @method get_error_line@ and @method get_error_message@ for identifying the source of the failure.
parse ::
        (JSON :< cls, Object :< cls) =>
        cls -> GodotString -> IO JSONParseResult
parse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSON_parse (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSON "parse" '[GodotString]
           (IO JSONParseResult)
         where
        nodeMethod = Godot.Core.JSON.parse

{-# NOINLINE bindJSON_print #-}

bindJSON_print :: MethodBind
bindJSON_print
  = unsafePerformIO $
      withCString "_JSON" $
        \ clsNamePtr ->
          withCString "print" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

print ::
        (JSON :< cls, Object :< cls) =>
        cls ->
          GodotVariant -> Maybe GodotString -> Maybe Bool -> IO GodotString
print cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSON_print (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSON "print"
           '[GodotVariant, Maybe GodotString, Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.JSON.print