{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PathFollow
       (Godot.Core.PathFollow._ROTATION_ORIENTED,
        Godot.Core.PathFollow._ROTATION_XY,
        Godot.Core.PathFollow._ROTATION_Y,
        Godot.Core.PathFollow._ROTATION_XYZ,
        Godot.Core.PathFollow._ROTATION_NONE,
        Godot.Core.PathFollow.get_cubic_interpolation,
        Godot.Core.PathFollow.get_h_offset,
        Godot.Core.PathFollow.get_offset,
        Godot.Core.PathFollow.get_rotation_mode,
        Godot.Core.PathFollow.get_unit_offset,
        Godot.Core.PathFollow.get_v_offset, Godot.Core.PathFollow.has_loop,
        Godot.Core.PathFollow.set_cubic_interpolation,
        Godot.Core.PathFollow.set_h_offset, Godot.Core.PathFollow.set_loop,
        Godot.Core.PathFollow.set_offset,
        Godot.Core.PathFollow.set_rotation_mode,
        Godot.Core.PathFollow.set_unit_offset,
        Godot.Core.PathFollow.set_v_offset)
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
import Godot.Core.Spatial()

_ROTATION_ORIENTED :: Int
_ROTATION_ORIENTED = 4

_ROTATION_XY :: Int
_ROTATION_XY = 2

_ROTATION_Y :: Int
_ROTATION_Y = 1

_ROTATION_XYZ :: Int
_ROTATION_XYZ = 3

_ROTATION_NONE :: Int
_ROTATION_NONE = 0

instance NodeProperty PathFollow "cubic_interp" Bool 'False where
        nodeProperty
          = (get_cubic_interpolation,
             wrapDroppingSetter set_cubic_interpolation, Nothing)

instance NodeProperty PathFollow "h_offset" Float 'False where
        nodeProperty
          = (get_h_offset, wrapDroppingSetter set_h_offset, Nothing)

instance NodeProperty PathFollow "loop" Bool 'False where
        nodeProperty = (has_loop, wrapDroppingSetter set_loop, Nothing)

instance NodeProperty PathFollow "offset" Float 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty PathFollow "rotation_mode" Int 'False where
        nodeProperty
          = (get_rotation_mode, wrapDroppingSetter set_rotation_mode,
             Nothing)

instance NodeProperty PathFollow "unit_offset" Float 'False where
        nodeProperty
          = (get_unit_offset, wrapDroppingSetter set_unit_offset, Nothing)

instance NodeProperty PathFollow "v_offset" Float 'False where
        nodeProperty
          = (get_v_offset, wrapDroppingSetter set_v_offset, Nothing)

{-# NOINLINE bindPathFollow_get_cubic_interpolation #-}

bindPathFollow_get_cubic_interpolation :: MethodBind
bindPathFollow_get_cubic_interpolation
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_cubic_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cubic_interpolation ::
                          (PathFollow :< cls, Object :< cls) => cls -> IO Bool
get_cubic_interpolation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_cubic_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "get_cubic_interpolation" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PathFollow.get_cubic_interpolation

{-# NOINLINE bindPathFollow_get_h_offset #-}

bindPathFollow_get_h_offset :: MethodBind
bindPathFollow_get_h_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_h_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "get_h_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.PathFollow.get_h_offset

{-# NOINLINE bindPathFollow_get_offset #-}

bindPathFollow_get_offset :: MethodBind
bindPathFollow_get_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_offset :: (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "get_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.PathFollow.get_offset

{-# NOINLINE bindPathFollow_get_rotation_mode #-}

bindPathFollow_get_rotation_mode :: MethodBind
bindPathFollow_get_rotation_mode
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_rotation_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rotation_mode ::
                    (PathFollow :< cls, Object :< cls) => cls -> IO Int
get_rotation_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_rotation_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "get_rotation_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PathFollow.get_rotation_mode

{-# NOINLINE bindPathFollow_get_unit_offset #-}

bindPathFollow_get_unit_offset :: MethodBind
bindPathFollow_get_unit_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_unit_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_unit_offset ::
                  (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_unit_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_unit_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "get_unit_offset" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PathFollow.get_unit_offset

{-# NOINLINE bindPathFollow_get_v_offset #-}

bindPathFollow_get_v_offset :: MethodBind
bindPathFollow_get_v_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_v_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "get_v_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.PathFollow.get_v_offset

{-# NOINLINE bindPathFollow_has_loop #-}

bindPathFollow_has_loop :: MethodBind
bindPathFollow_has_loop
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "has_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_loop :: (PathFollow :< cls, Object :< cls) => cls -> IO Bool
has_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_has_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "has_loop" '[] (IO Bool) where
        nodeMethod = Godot.Core.PathFollow.has_loop

{-# NOINLINE bindPathFollow_set_cubic_interpolation #-}

bindPathFollow_set_cubic_interpolation :: MethodBind
bindPathFollow_set_cubic_interpolation
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_cubic_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cubic_interpolation ::
                          (PathFollow :< cls, Object :< cls) => cls -> Bool -> IO ()
set_cubic_interpolation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_cubic_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_cubic_interpolation" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PathFollow.set_cubic_interpolation

{-# NOINLINE bindPathFollow_set_h_offset #-}

bindPathFollow_set_h_offset :: MethodBind
bindPathFollow_set_h_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_h_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_h_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow.set_h_offset

{-# NOINLINE bindPathFollow_set_loop #-}

bindPathFollow_set_loop :: MethodBind
bindPathFollow_set_loop
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_loop ::
           (PathFollow :< cls, Object :< cls) => cls -> Bool -> IO ()
set_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_loop" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.PathFollow.set_loop

{-# NOINLINE bindPathFollow_set_offset #-}

bindPathFollow_set_offset :: MethodBind
bindPathFollow_set_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_offset ::
             (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.PathFollow.set_offset

{-# NOINLINE bindPathFollow_set_rotation_mode #-}

bindPathFollow_set_rotation_mode :: MethodBind
bindPathFollow_set_rotation_mode
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_rotation_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rotation_mode ::
                    (PathFollow :< cls, Object :< cls) => cls -> Int -> IO ()
set_rotation_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_rotation_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_rotation_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow.set_rotation_mode

{-# NOINLINE bindPathFollow_set_unit_offset #-}

bindPathFollow_set_unit_offset :: MethodBind
bindPathFollow_set_unit_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_unit_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_unit_offset ::
                  (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_unit_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_unit_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_unit_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow.set_unit_offset

{-# NOINLINE bindPathFollow_set_v_offset #-}

bindPathFollow_set_v_offset :: MethodBind
bindPathFollow_set_v_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_v_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow "set_v_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow.set_v_offset