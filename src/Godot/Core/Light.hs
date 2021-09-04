{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Light
       (Godot.Core.Light._PARAM_SHADOW_NORMAL_BIAS,
        Godot.Core.Light._PARAM_SHADOW_SPLIT_2_OFFSET,
        Godot.Core.Light._PARAM_SPECULAR,
        Godot.Core.Light._PARAM_SHADOW_SPLIT_1_OFFSET,
        Godot.Core.Light._PARAM_INDIRECT_ENERGY,
        Godot.Core.Light._PARAM_RANGE,
        Godot.Core.Light._PARAM_SPOT_ATTENUATION,
        Godot.Core.Light._PARAM_SHADOW_MAX_DISTANCE,
        Godot.Core.Light._PARAM_MAX,
        Godot.Core.Light._PARAM_SHADOW_BIAS_SPLIT_SCALE,
        Godot.Core.Light._BAKE_DISABLED,
        Godot.Core.Light._PARAM_ATTENUATION,
        Godot.Core.Light._PARAM_ENERGY,
        Godot.Core.Light._PARAM_SHADOW_SPLIT_3_OFFSET,
        Godot.Core.Light._BAKE_INDIRECT,
        Godot.Core.Light._PARAM_SHADOW_BIAS, Godot.Core.Light._BAKE_ALL,
        Godot.Core.Light._PARAM_CONTACT_SHADOW_SIZE,
        Godot.Core.Light._PARAM_SPOT_ANGLE, Godot.Core.Light.get_bake_mode,
        Godot.Core.Light.get_color, Godot.Core.Light.get_cull_mask,
        Godot.Core.Light.get_param, Godot.Core.Light.get_shadow_color,
        Godot.Core.Light.get_shadow_reverse_cull_face,
        Godot.Core.Light.has_shadow, Godot.Core.Light.is_editor_only,
        Godot.Core.Light.is_negative, Godot.Core.Light.set_bake_mode,
        Godot.Core.Light.set_color, Godot.Core.Light.set_cull_mask,
        Godot.Core.Light.set_editor_only, Godot.Core.Light.set_negative,
        Godot.Core.Light.set_param, Godot.Core.Light.set_shadow,
        Godot.Core.Light.set_shadow_color,
        Godot.Core.Light.set_shadow_reverse_cull_face)
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
import Godot.Core.VisualInstance()

_PARAM_SHADOW_NORMAL_BIAS :: Int
_PARAM_SHADOW_NORMAL_BIAS = 12

_PARAM_SHADOW_SPLIT_2_OFFSET :: Int
_PARAM_SHADOW_SPLIT_2_OFFSET = 10

_PARAM_SPECULAR :: Int
_PARAM_SPECULAR = 2

_PARAM_SHADOW_SPLIT_1_OFFSET :: Int
_PARAM_SHADOW_SPLIT_1_OFFSET = 9

_PARAM_INDIRECT_ENERGY :: Int
_PARAM_INDIRECT_ENERGY = 1

_PARAM_RANGE :: Int
_PARAM_RANGE = 3

_PARAM_SPOT_ATTENUATION :: Int
_PARAM_SPOT_ATTENUATION = 6

_PARAM_SHADOW_MAX_DISTANCE :: Int
_PARAM_SHADOW_MAX_DISTANCE = 8

_PARAM_MAX :: Int
_PARAM_MAX = 15

_PARAM_SHADOW_BIAS_SPLIT_SCALE :: Int
_PARAM_SHADOW_BIAS_SPLIT_SCALE = 14

_BAKE_DISABLED :: Int
_BAKE_DISABLED = 0

_PARAM_ATTENUATION :: Int
_PARAM_ATTENUATION = 4

_PARAM_ENERGY :: Int
_PARAM_ENERGY = 0

_PARAM_SHADOW_SPLIT_3_OFFSET :: Int
_PARAM_SHADOW_SPLIT_3_OFFSET = 11

_BAKE_INDIRECT :: Int
_BAKE_INDIRECT = 1

_PARAM_SHADOW_BIAS :: Int
_PARAM_SHADOW_BIAS = 13

_BAKE_ALL :: Int
_BAKE_ALL = 2

_PARAM_CONTACT_SHADOW_SIZE :: Int
_PARAM_CONTACT_SHADOW_SIZE = 7

_PARAM_SPOT_ANGLE :: Int
_PARAM_SPOT_ANGLE = 5

instance NodeProperty Light "editor_only" Bool 'False where
        nodeProperty
          = (is_editor_only, wrapDroppingSetter set_editor_only, Nothing)

instance NodeProperty Light "light_bake_mode" Int 'False where
        nodeProperty
          = (get_bake_mode, wrapDroppingSetter set_bake_mode, Nothing)

instance NodeProperty Light "light_color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

instance NodeProperty Light "light_cull_mask" Int 'False where
        nodeProperty
          = (get_cull_mask, wrapDroppingSetter set_cull_mask, Nothing)

instance NodeProperty Light "light_energy" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_param, wrapIndexedSetter 0 set_param,
             Nothing)

instance NodeProperty Light "light_indirect_energy" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param, wrapIndexedSetter 1 set_param,
             Nothing)

instance NodeProperty Light "light_negative" Bool 'False where
        nodeProperty
          = (is_negative, wrapDroppingSetter set_negative, Nothing)

instance NodeProperty Light "light_specular" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 2 get_param, wrapIndexedSetter 2 set_param,
             Nothing)

instance NodeProperty Light "shadow_bias" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 13 get_param, wrapIndexedSetter 13 set_param,
             Nothing)

instance NodeProperty Light "shadow_color" Color 'False where
        nodeProperty
          = (get_shadow_color, wrapDroppingSetter set_shadow_color, Nothing)

instance NodeProperty Light "shadow_contact" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 7 get_param, wrapIndexedSetter 7 set_param,
             Nothing)

instance NodeProperty Light "shadow_enabled" Bool 'False where
        nodeProperty = (has_shadow, wrapDroppingSetter set_shadow, Nothing)

instance NodeProperty Light "shadow_reverse_cull_face" Bool 'False
         where
        nodeProperty
          = (get_shadow_reverse_cull_face,
             wrapDroppingSetter set_shadow_reverse_cull_face, Nothing)

{-# NOINLINE bindLight_get_bake_mode #-}

bindLight_get_bake_mode :: MethodBind
bindLight_get_bake_mode
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bake_mode :: (Light :< cls, Object :< cls) => cls -> IO Int
get_bake_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_bake_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "get_bake_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Light.get_bake_mode

{-# NOINLINE bindLight_get_color #-}

bindLight_get_color :: MethodBind
bindLight_get_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color :: (Light :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "get_color" '[] (IO Color) where
        nodeMethod = Godot.Core.Light.get_color

{-# NOINLINE bindLight_get_cull_mask #-}

bindLight_get_cull_mask :: MethodBind
bindLight_get_cull_mask
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cull_mask :: (Light :< cls, Object :< cls) => cls -> IO Int
get_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "get_cull_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.Light.get_cull_mask

{-# NOINLINE bindLight_get_param #-}

bindLight_get_param :: MethodBind
bindLight_get_param
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_param ::
            (Light :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "get_param" '[Int] (IO Float) where
        nodeMethod = Godot.Core.Light.get_param

{-# NOINLINE bindLight_get_shadow_color #-}

bindLight_get_shadow_color :: MethodBind
bindLight_get_shadow_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shadow_color ::
                   (Light :< cls, Object :< cls) => cls -> IO Color
get_shadow_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_shadow_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "get_shadow_color" '[] (IO Color) where
        nodeMethod = Godot.Core.Light.get_shadow_color

{-# NOINLINE bindLight_get_shadow_reverse_cull_face #-}

bindLight_get_shadow_reverse_cull_face :: MethodBind
bindLight_get_shadow_reverse_cull_face
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_shadow_reverse_cull_face" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shadow_reverse_cull_face ::
                               (Light :< cls, Object :< cls) => cls -> IO Bool
get_shadow_reverse_cull_face cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_shadow_reverse_cull_face
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "get_shadow_reverse_cull_face" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Light.get_shadow_reverse_cull_face

{-# NOINLINE bindLight_has_shadow #-}

bindLight_has_shadow :: MethodBind
bindLight_has_shadow
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "has_shadow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_shadow :: (Light :< cls, Object :< cls) => cls -> IO Bool
has_shadow cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_has_shadow (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "has_shadow" '[] (IO Bool) where
        nodeMethod = Godot.Core.Light.has_shadow

{-# NOINLINE bindLight_is_editor_only #-}

bindLight_is_editor_only :: MethodBind
bindLight_is_editor_only
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "is_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_editor_only :: (Light :< cls, Object :< cls) => cls -> IO Bool
is_editor_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_is_editor_only (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "is_editor_only" '[] (IO Bool) where
        nodeMethod = Godot.Core.Light.is_editor_only

{-# NOINLINE bindLight_is_negative #-}

bindLight_is_negative :: MethodBind
bindLight_is_negative
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "is_negative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_negative :: (Light :< cls, Object :< cls) => cls -> IO Bool
is_negative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_is_negative (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "is_negative" '[] (IO Bool) where
        nodeMethod = Godot.Core.Light.is_negative

{-# NOINLINE bindLight_set_bake_mode #-}

bindLight_set_bake_mode :: MethodBind
bindLight_set_bake_mode
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bake_mode ::
                (Light :< cls, Object :< cls) => cls -> Int -> IO ()
set_bake_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_bake_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_bake_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Light.set_bake_mode

{-# NOINLINE bindLight_set_color #-}

bindLight_set_color :: MethodBind
bindLight_set_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color :: (Light :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_color" '[Color] (IO ()) where
        nodeMethod = Godot.Core.Light.set_color

{-# NOINLINE bindLight_set_cull_mask #-}

bindLight_set_cull_mask :: MethodBind
bindLight_set_cull_mask
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cull_mask ::
                (Light :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_cull_mask" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Light.set_cull_mask

{-# NOINLINE bindLight_set_editor_only #-}

bindLight_set_editor_only :: MethodBind
bindLight_set_editor_only
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_editor_only ::
                  (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editor_only cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_editor_only (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_editor_only" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Light.set_editor_only

{-# NOINLINE bindLight_set_negative #-}

bindLight_set_negative :: MethodBind
bindLight_set_negative
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_negative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_negative ::
               (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_negative cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_negative (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_negative" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Light.set_negative

{-# NOINLINE bindLight_set_param #-}

bindLight_set_param :: MethodBind
bindLight_set_param
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_param ::
            (Light :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_param" '[Int, Float] (IO ()) where
        nodeMethod = Godot.Core.Light.set_param

{-# NOINLINE bindLight_set_shadow #-}

bindLight_set_shadow :: MethodBind
bindLight_set_shadow
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_shadow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shadow :: (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shadow cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_shadow (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_shadow" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Light.set_shadow

{-# NOINLINE bindLight_set_shadow_color #-}

bindLight_set_shadow_color :: MethodBind
bindLight_set_shadow_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shadow_color ::
                   (Light :< cls, Object :< cls) => cls -> Color -> IO ()
set_shadow_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_shadow_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_shadow_color" '[Color] (IO ()) where
        nodeMethod = Godot.Core.Light.set_shadow_color

{-# NOINLINE bindLight_set_shadow_reverse_cull_face #-}

bindLight_set_shadow_reverse_cull_face :: MethodBind
bindLight_set_shadow_reverse_cull_face
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_shadow_reverse_cull_face" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shadow_reverse_cull_face ::
                               (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shadow_reverse_cull_face cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_shadow_reverse_cull_face
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light "set_shadow_reverse_cull_face" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Light.set_shadow_reverse_cull_face