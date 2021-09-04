{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourceFormatLoader
       (Godot.Core.ResourceFormatLoader.get_dependencies,
        Godot.Core.ResourceFormatLoader.get_recognized_extensions,
        Godot.Core.ResourceFormatLoader.get_resource_type,
        Godot.Core.ResourceFormatLoader.handles_type,
        Godot.Core.ResourceFormatLoader.load,
        Godot.Core.ResourceFormatLoader.rename_dependencies)
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

{-# NOINLINE bindResourceFormatLoader_get_dependencies #-}

bindResourceFormatLoader_get_dependencies :: MethodBind
bindResourceFormatLoader_get_dependencies
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "get_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_dependencies ::
                   (ResourceFormatLoader :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO ()
get_dependencies cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_get_dependencies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatLoader "get_dependencies"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ResourceFormatLoader.get_dependencies

{-# NOINLINE bindResourceFormatLoader_get_recognized_extensions #-}

bindResourceFormatLoader_get_recognized_extensions :: MethodBind
bindResourceFormatLoader_get_recognized_extensions
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_recognized_extensions ::
                            (ResourceFormatLoader :< cls, Object :< cls) =>
                            cls -> IO PoolStringArray
get_recognized_extensions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceFormatLoader_get_recognized_extensions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatLoader
           "get_recognized_extensions"
           '[]
           (IO PoolStringArray)
         where
        nodeMethod
          = Godot.Core.ResourceFormatLoader.get_recognized_extensions

{-# NOINLINE bindResourceFormatLoader_get_resource_type #-}

bindResourceFormatLoader_get_resource_type :: MethodBind
bindResourceFormatLoader_get_resource_type
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "get_resource_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_resource_type ::
                    (ResourceFormatLoader :< cls, Object :< cls) =>
                    cls -> GodotString -> IO GodotString
get_resource_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_get_resource_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatLoader "get_resource_type"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ResourceFormatLoader.get_resource_type

{-# NOINLINE bindResourceFormatLoader_handles_type #-}

bindResourceFormatLoader_handles_type :: MethodBind
bindResourceFormatLoader_handles_type
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "handles_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

handles_type ::
               (ResourceFormatLoader :< cls, Object :< cls) =>
               cls -> GodotString -> IO Bool
handles_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_handles_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatLoader "handles_type"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ResourceFormatLoader.handles_type

{-# NOINLINE bindResourceFormatLoader_load #-}

bindResourceFormatLoader_load :: MethodBind
bindResourceFormatLoader_load
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

load ::
       (ResourceFormatLoader :< cls, Object :< cls) =>
       cls -> GodotString -> GodotString -> IO GodotVariant
load cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_load (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatLoader "load"
           '[GodotString, GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ResourceFormatLoader.load

{-# NOINLINE bindResourceFormatLoader_rename_dependencies #-}

bindResourceFormatLoader_rename_dependencies :: MethodBind
bindResourceFormatLoader_rename_dependencies
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "rename_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rename_dependencies ::
                      (ResourceFormatLoader :< cls, Object :< cls) =>
                      cls -> GodotString -> GodotString -> IO Int
rename_dependencies cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_rename_dependencies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatLoader "rename_dependencies"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.ResourceFormatLoader.rename_dependencies