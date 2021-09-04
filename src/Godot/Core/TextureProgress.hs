{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextureProgress
       (Godot.Core.TextureProgress._FILL_BOTTOM_TO_TOP,
        Godot.Core.TextureProgress._FILL_TOP_TO_BOTTOM,
        Godot.Core.TextureProgress._FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_RIGHT_TO_LEFT,
        Godot.Core.TextureProgress._FILL_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_LEFT_TO_RIGHT,
        Godot.Core.TextureProgress._FILL_BILINEAR_LEFT_AND_RIGHT,
        Godot.Core.TextureProgress._FILL_COUNTER_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_BILINEAR_TOP_AND_BOTTOM,
        Godot.Core.TextureProgress.get_fill_degrees,
        Godot.Core.TextureProgress.get_fill_mode,
        Godot.Core.TextureProgress.get_nine_patch_stretch,
        Godot.Core.TextureProgress.get_over_texture,
        Godot.Core.TextureProgress.get_progress_texture,
        Godot.Core.TextureProgress.get_radial_center_offset,
        Godot.Core.TextureProgress.get_radial_initial_angle,
        Godot.Core.TextureProgress.get_stretch_margin,
        Godot.Core.TextureProgress.get_tint_over,
        Godot.Core.TextureProgress.get_tint_progress,
        Godot.Core.TextureProgress.get_tint_under,
        Godot.Core.TextureProgress.get_under_texture,
        Godot.Core.TextureProgress.set_fill_degrees,
        Godot.Core.TextureProgress.set_fill_mode,
        Godot.Core.TextureProgress.set_nine_patch_stretch,
        Godot.Core.TextureProgress.set_over_texture,
        Godot.Core.TextureProgress.set_progress_texture,
        Godot.Core.TextureProgress.set_radial_center_offset,
        Godot.Core.TextureProgress.set_radial_initial_angle,
        Godot.Core.TextureProgress.set_stretch_margin,
        Godot.Core.TextureProgress.set_tint_over,
        Godot.Core.TextureProgress.set_tint_progress,
        Godot.Core.TextureProgress.set_tint_under,
        Godot.Core.TextureProgress.set_under_texture)
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
import Godot.Core.Range()

_FILL_BOTTOM_TO_TOP :: Int
_FILL_BOTTOM_TO_TOP = 3

_FILL_TOP_TO_BOTTOM :: Int
_FILL_TOP_TO_BOTTOM = 2

_FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE :: Int
_FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE = 8

_FILL_RIGHT_TO_LEFT :: Int
_FILL_RIGHT_TO_LEFT = 1

_FILL_CLOCKWISE :: Int
_FILL_CLOCKWISE = 4

_FILL_LEFT_TO_RIGHT :: Int
_FILL_LEFT_TO_RIGHT = 0

_FILL_BILINEAR_LEFT_AND_RIGHT :: Int
_FILL_BILINEAR_LEFT_AND_RIGHT = 6

_FILL_COUNTER_CLOCKWISE :: Int
_FILL_COUNTER_CLOCKWISE = 5

_FILL_BILINEAR_TOP_AND_BOTTOM :: Int
_FILL_BILINEAR_TOP_AND_BOTTOM = 7

instance NodeProperty TextureProgress "fill_mode" Int 'False where
        nodeProperty
          = (get_fill_mode, wrapDroppingSetter set_fill_mode, Nothing)

instance NodeProperty TextureProgress "nine_patch_stretch" Bool
           'False
         where
        nodeProperty
          = (get_nine_patch_stretch,
             wrapDroppingSetter set_nine_patch_stretch, Nothing)

instance NodeProperty TextureProgress "radial_center_offset"
           Vector2
           'False
         where
        nodeProperty
          = (get_radial_center_offset,
             wrapDroppingSetter set_radial_center_offset, Nothing)

instance NodeProperty TextureProgress "radial_fill_degrees" Float
           'False
         where
        nodeProperty
          = (get_fill_degrees, wrapDroppingSetter set_fill_degrees, Nothing)

instance NodeProperty TextureProgress "radial_initial_angle" Float
           'False
         where
        nodeProperty
          = (get_radial_initial_angle,
             wrapDroppingSetter set_radial_initial_angle, Nothing)

instance NodeProperty TextureProgress "stretch_margin_bottom" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_stretch_margin,
             wrapIndexedSetter 3 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "stretch_margin_left" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_stretch_margin,
             wrapIndexedSetter 0 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "stretch_margin_right" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_stretch_margin,
             wrapIndexedSetter 2 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "stretch_margin_top" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_stretch_margin,
             wrapIndexedSetter 1 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "texture_over" Texture 'False
         where
        nodeProperty
          = (get_over_texture, wrapDroppingSetter set_over_texture, Nothing)

instance NodeProperty TextureProgress "texture_progress" Texture
           'False
         where
        nodeProperty
          = (get_progress_texture, wrapDroppingSetter set_progress_texture,
             Nothing)

instance NodeProperty TextureProgress "texture_under" Texture
           'False
         where
        nodeProperty
          = (get_under_texture, wrapDroppingSetter set_under_texture,
             Nothing)

instance NodeProperty TextureProgress "tint_over" Color 'False
         where
        nodeProperty
          = (get_tint_over, wrapDroppingSetter set_tint_over, Nothing)

instance NodeProperty TextureProgress "tint_progress" Color 'False
         where
        nodeProperty
          = (get_tint_progress, wrapDroppingSetter set_tint_progress,
             Nothing)

instance NodeProperty TextureProgress "tint_under" Color 'False
         where
        nodeProperty
          = (get_tint_under, wrapDroppingSetter set_tint_under, Nothing)

{-# NOINLINE bindTextureProgress_get_fill_degrees #-}

bindTextureProgress_get_fill_degrees :: MethodBind
bindTextureProgress_get_fill_degrees
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_fill_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fill_degrees ::
                   (TextureProgress :< cls, Object :< cls) => cls -> IO Float
get_fill_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_fill_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_fill_degrees" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.TextureProgress.get_fill_degrees

{-# NOINLINE bindTextureProgress_get_fill_mode #-}

bindTextureProgress_get_fill_mode :: MethodBind
bindTextureProgress_get_fill_mode
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_fill_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fill_mode ::
                (TextureProgress :< cls, Object :< cls) => cls -> IO Int
get_fill_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_fill_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_fill_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TextureProgress.get_fill_mode

{-# NOINLINE bindTextureProgress_get_nine_patch_stretch #-}

bindTextureProgress_get_nine_patch_stretch :: MethodBind
bindTextureProgress_get_nine_patch_stretch
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_nine_patch_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_nine_patch_stretch ::
                         (TextureProgress :< cls, Object :< cls) => cls -> IO Bool
get_nine_patch_stretch cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_nine_patch_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_nine_patch_stretch" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TextureProgress.get_nine_patch_stretch

{-# NOINLINE bindTextureProgress_get_over_texture #-}

bindTextureProgress_get_over_texture :: MethodBind
bindTextureProgress_get_over_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_over_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_over_texture ::
                   (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_over_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_over_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_over_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureProgress.get_over_texture

{-# NOINLINE bindTextureProgress_get_progress_texture #-}

bindTextureProgress_get_progress_texture :: MethodBind
bindTextureProgress_get_progress_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_progress_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_progress_texture ::
                       (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_progress_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_progress_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_progress_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureProgress.get_progress_texture

{-# NOINLINE bindTextureProgress_get_radial_center_offset #-}

bindTextureProgress_get_radial_center_offset :: MethodBind
bindTextureProgress_get_radial_center_offset
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_radial_center_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radial_center_offset ::
                           (TextureProgress :< cls, Object :< cls) => cls -> IO Vector2
get_radial_center_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_radial_center_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_radial_center_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TextureProgress.get_radial_center_offset

{-# NOINLINE bindTextureProgress_get_radial_initial_angle #-}

bindTextureProgress_get_radial_initial_angle :: MethodBind
bindTextureProgress_get_radial_initial_angle
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_radial_initial_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radial_initial_angle ::
                           (TextureProgress :< cls, Object :< cls) => cls -> IO Float
get_radial_initial_angle cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_radial_initial_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_radial_initial_angle" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.TextureProgress.get_radial_initial_angle

{-# NOINLINE bindTextureProgress_get_stretch_margin #-}

bindTextureProgress_get_stretch_margin :: MethodBind
bindTextureProgress_get_stretch_margin
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_stretch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_stretch_margin ::
                     (TextureProgress :< cls, Object :< cls) => cls -> Int -> IO Int
get_stretch_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_stretch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_stretch_margin" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.TextureProgress.get_stretch_margin

{-# NOINLINE bindTextureProgress_get_tint_over #-}

bindTextureProgress_get_tint_over :: MethodBind
bindTextureProgress_get_tint_over
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_over" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tint_over ::
                (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_over cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_over
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_tint_over" '[] (IO Color)
         where
        nodeMethod = Godot.Core.TextureProgress.get_tint_over

{-# NOINLINE bindTextureProgress_get_tint_progress #-}

bindTextureProgress_get_tint_progress :: MethodBind
bindTextureProgress_get_tint_progress
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tint_progress ::
                    (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_progress cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_tint_progress" '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.TextureProgress.get_tint_progress

{-# NOINLINE bindTextureProgress_get_tint_under #-}

bindTextureProgress_get_tint_under :: MethodBind
bindTextureProgress_get_tint_under
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_under" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tint_under ::
                 (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_under cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_under
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_tint_under" '[] (IO Color)
         where
        nodeMethod = Godot.Core.TextureProgress.get_tint_under

{-# NOINLINE bindTextureProgress_get_under_texture #-}

bindTextureProgress_get_under_texture :: MethodBind
bindTextureProgress_get_under_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_under_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_under_texture ::
                    (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_under_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_under_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_under_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureProgress.get_under_texture

{-# NOINLINE bindTextureProgress_set_fill_degrees #-}

bindTextureProgress_set_fill_degrees :: MethodBind
bindTextureProgress_set_fill_degrees
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_fill_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fill_degrees ::
                   (TextureProgress :< cls, Object :< cls) => cls -> Float -> IO ()
set_fill_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_fill_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_fill_degrees" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_fill_degrees

{-# NOINLINE bindTextureProgress_set_fill_mode #-}

bindTextureProgress_set_fill_mode :: MethodBind
bindTextureProgress_set_fill_mode
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_fill_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fill_mode ::
                (TextureProgress :< cls, Object :< cls) => cls -> Int -> IO ()
set_fill_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_fill_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_fill_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_fill_mode

{-# NOINLINE bindTextureProgress_set_nine_patch_stretch #-}

bindTextureProgress_set_nine_patch_stretch :: MethodBind
bindTextureProgress_set_nine_patch_stretch
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_nine_patch_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_nine_patch_stretch ::
                         (TextureProgress :< cls, Object :< cls) => cls -> Bool -> IO ()
set_nine_patch_stretch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_nine_patch_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_nine_patch_stretch"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_nine_patch_stretch

{-# NOINLINE bindTextureProgress_set_over_texture #-}

bindTextureProgress_set_over_texture :: MethodBind
bindTextureProgress_set_over_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_over_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_over_texture ::
                   (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_over_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_over_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_over_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_over_texture

{-# NOINLINE bindTextureProgress_set_progress_texture #-}

bindTextureProgress_set_progress_texture :: MethodBind
bindTextureProgress_set_progress_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_progress_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_progress_texture ::
                       (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_progress_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_progress_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_progress_texture"
           '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_progress_texture

{-# NOINLINE bindTextureProgress_set_radial_center_offset #-}

bindTextureProgress_set_radial_center_offset :: MethodBind
bindTextureProgress_set_radial_center_offset
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_radial_center_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radial_center_offset ::
                           (TextureProgress :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_radial_center_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_radial_center_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_radial_center_offset"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_radial_center_offset

{-# NOINLINE bindTextureProgress_set_radial_initial_angle #-}

bindTextureProgress_set_radial_initial_angle :: MethodBind
bindTextureProgress_set_radial_initial_angle
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_radial_initial_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radial_initial_angle ::
                           (TextureProgress :< cls, Object :< cls) => cls -> Float -> IO ()
set_radial_initial_angle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_radial_initial_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_radial_initial_angle"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_radial_initial_angle

{-# NOINLINE bindTextureProgress_set_stretch_margin #-}

bindTextureProgress_set_stretch_margin :: MethodBind
bindTextureProgress_set_stretch_margin
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_stretch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_stretch_margin ::
                     (TextureProgress :< cls, Object :< cls) =>
                     cls -> Int -> Int -> IO ()
set_stretch_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_stretch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_stretch_margin"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_stretch_margin

{-# NOINLINE bindTextureProgress_set_tint_over #-}

bindTextureProgress_set_tint_over :: MethodBind
bindTextureProgress_set_tint_over
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_over" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tint_over ::
                (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_over cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_over
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_tint_over" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_tint_over

{-# NOINLINE bindTextureProgress_set_tint_progress #-}

bindTextureProgress_set_tint_progress :: MethodBind
bindTextureProgress_set_tint_progress
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tint_progress ::
                    (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_progress cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_tint_progress" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_tint_progress

{-# NOINLINE bindTextureProgress_set_tint_under #-}

bindTextureProgress_set_tint_under :: MethodBind
bindTextureProgress_set_tint_under
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_under" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tint_under ::
                 (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_under cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_under
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_tint_under" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_tint_under

{-# NOINLINE bindTextureProgress_set_under_texture #-}

bindTextureProgress_set_under_texture :: MethodBind
bindTextureProgress_set_under_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_under_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_under_texture ::
                    (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_under_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_under_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_under_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_under_texture