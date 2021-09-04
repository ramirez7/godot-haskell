{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourceInteractiveLoader
       (Godot.Core.ResourceInteractiveLoader.get_resource,
        Godot.Core.ResourceInteractiveLoader.get_stage,
        Godot.Core.ResourceInteractiveLoader.get_stage_count,
        Godot.Core.ResourceInteractiveLoader.poll,
        Godot.Core.ResourceInteractiveLoader.wait)
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

{-# NOINLINE bindResourceInteractiveLoader_get_resource #-}

bindResourceInteractiveLoader_get_resource :: MethodBind
bindResourceInteractiveLoader_get_resource
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_resource ::
               (ResourceInteractiveLoader :< cls, Object :< cls) =>
               cls -> IO Resource
get_resource cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_get_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceInteractiveLoader "get_resource" '[]
           (IO Resource)
         where
        nodeMethod = Godot.Core.ResourceInteractiveLoader.get_resource

{-# NOINLINE bindResourceInteractiveLoader_get_stage #-}

bindResourceInteractiveLoader_get_stage :: MethodBind
bindResourceInteractiveLoader_get_stage
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_stage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_stage ::
            (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
get_stage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_get_stage
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceInteractiveLoader "get_stage" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.ResourceInteractiveLoader.get_stage

{-# NOINLINE bindResourceInteractiveLoader_get_stage_count #-}

bindResourceInteractiveLoader_get_stage_count :: MethodBind
bindResourceInteractiveLoader_get_stage_count
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_stage_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_stage_count ::
                  (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
get_stage_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceInteractiveLoader_get_stage_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceInteractiveLoader "get_stage_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.ResourceInteractiveLoader.get_stage_count

{-# NOINLINE bindResourceInteractiveLoader_poll #-}

bindResourceInteractiveLoader_poll :: MethodBind
bindResourceInteractiveLoader_poll
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

poll ::
       (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_poll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceInteractiveLoader "poll" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ResourceInteractiveLoader.poll

{-# NOINLINE bindResourceInteractiveLoader_wait #-}

bindResourceInteractiveLoader_wait :: MethodBind
bindResourceInteractiveLoader_wait
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

wait ::
       (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_wait
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceInteractiveLoader "wait" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ResourceInteractiveLoader.wait