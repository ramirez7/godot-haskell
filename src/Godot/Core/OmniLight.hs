{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.OmniLight
       (Godot.Core.OmniLight._SHADOW_DUAL_PARABOLOID,
        Godot.Core.OmniLight._SHADOW_DETAIL_HORIZONTAL,
        Godot.Core.OmniLight._SHADOW_DETAIL_VERTICAL,
        Godot.Core.OmniLight._SHADOW_CUBE, Godot.Core.OmniLight.get_param,
        Godot.Core.OmniLight.set_param,
        Godot.Core.OmniLight.get_shadow_detail,
        Godot.Core.OmniLight.get_shadow_mode,
        Godot.Core.OmniLight.set_shadow_detail,
        Godot.Core.OmniLight.set_shadow_mode)
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
import Godot.Core.Light()

_SHADOW_DUAL_PARABOLOID :: Int
_SHADOW_DUAL_PARABOLOID = 0

_SHADOW_DETAIL_HORIZONTAL :: Int
_SHADOW_DETAIL_HORIZONTAL = 1

_SHADOW_DETAIL_VERTICAL :: Int
_SHADOW_DETAIL_VERTICAL = 0

_SHADOW_CUBE :: Int
_SHADOW_CUBE = 1

{-# NOINLINE bindOmniLight_get_param #-}

bindOmniLight_get_param :: MethodBind
bindOmniLight_get_param
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_param ::
            (OmniLight :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OmniLight "get_param" '[Int] (IO Float) where
        nodeMethod = Godot.Core.OmniLight.get_param

{-# NOINLINE bindOmniLight_set_param #-}

bindOmniLight_set_param :: MethodBind
bindOmniLight_set_param
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_param ::
            (OmniLight :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OmniLight "set_param" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.OmniLight.set_param

instance NodeProperty OmniLight "omni_attenuation" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param, wrapIndexedSetter 4 set_param,
             Nothing)

instance NodeProperty OmniLight "omni_range" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 3 get_param, wrapIndexedSetter 3 set_param,
             Nothing)

instance NodeProperty OmniLight "omni_shadow_detail" Int 'False
         where
        nodeProperty
          = (get_shadow_detail, wrapDroppingSetter set_shadow_detail,
             Nothing)

instance NodeProperty OmniLight "omni_shadow_mode" Int 'False where
        nodeProperty
          = (get_shadow_mode, wrapDroppingSetter set_shadow_mode, Nothing)

{-# NOINLINE bindOmniLight_get_shadow_detail #-}

bindOmniLight_get_shadow_detail :: MethodBind
bindOmniLight_get_shadow_detail
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "get_shadow_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shadow_detail ::
                    (OmniLight :< cls, Object :< cls) => cls -> IO Int
get_shadow_detail cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_get_shadow_detail (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OmniLight "get_shadow_detail" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OmniLight.get_shadow_detail

{-# NOINLINE bindOmniLight_get_shadow_mode #-}

bindOmniLight_get_shadow_mode :: MethodBind
bindOmniLight_get_shadow_mode
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "get_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shadow_mode ::
                  (OmniLight :< cls, Object :< cls) => cls -> IO Int
get_shadow_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_get_shadow_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OmniLight "get_shadow_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.OmniLight.get_shadow_mode

{-# NOINLINE bindOmniLight_set_shadow_detail #-}

bindOmniLight_set_shadow_detail :: MethodBind
bindOmniLight_set_shadow_detail
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "set_shadow_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shadow_detail ::
                    (OmniLight :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_detail cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_set_shadow_detail (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OmniLight "set_shadow_detail" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.OmniLight.set_shadow_detail

{-# NOINLINE bindOmniLight_set_shadow_mode #-}

bindOmniLight_set_shadow_mode :: MethodBind
bindOmniLight_set_shadow_mode
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shadow_mode ::
                  (OmniLight :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_set_shadow_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OmniLight "set_shadow_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.OmniLight.set_shadow_mode