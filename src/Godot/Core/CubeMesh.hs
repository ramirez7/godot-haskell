{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CubeMesh
       (Godot.Core.CubeMesh.get_size,
        Godot.Core.CubeMesh.get_subdivide_depth,
        Godot.Core.CubeMesh.get_subdivide_height,
        Godot.Core.CubeMesh.get_subdivide_width,
        Godot.Core.CubeMesh.set_size,
        Godot.Core.CubeMesh.set_subdivide_depth,
        Godot.Core.CubeMesh.set_subdivide_height,
        Godot.Core.CubeMesh.set_subdivide_width)
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
import Godot.Core.PrimitiveMesh()

instance NodeProperty CubeMesh "size" Vector3 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

instance NodeProperty CubeMesh "subdivide_depth" Int 'False where
        nodeProperty
          = (get_subdivide_depth, wrapDroppingSetter set_subdivide_depth,
             Nothing)

instance NodeProperty CubeMesh "subdivide_height" Int 'False where
        nodeProperty
          = (get_subdivide_height, wrapDroppingSetter set_subdivide_height,
             Nothing)

instance NodeProperty CubeMesh "subdivide_width" Int 'False where
        nodeProperty
          = (get_subdivide_width, wrapDroppingSetter set_subdivide_width,
             Nothing)

{-# NOINLINE bindCubeMesh_get_size #-}

bindCubeMesh_get_size :: MethodBind
bindCubeMesh_get_size
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size :: (CubeMesh :< cls, Object :< cls) => cls -> IO Vector3
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "get_size" '[] (IO Vector3) where
        nodeMethod = Godot.Core.CubeMesh.get_size

{-# NOINLINE bindCubeMesh_get_subdivide_depth #-}

bindCubeMesh_get_subdivide_depth :: MethodBind
bindCubeMesh_get_subdivide_depth
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_subdivide_depth ::
                      (CubeMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "get_subdivide_depth" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CubeMesh.get_subdivide_depth

{-# NOINLINE bindCubeMesh_get_subdivide_height #-}

bindCubeMesh_get_subdivide_height :: MethodBind
bindCubeMesh_get_subdivide_height
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_subdivide_height ::
                       (CubeMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_subdivide_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "get_subdivide_height" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CubeMesh.get_subdivide_height

{-# NOINLINE bindCubeMesh_get_subdivide_width #-}

bindCubeMesh_get_subdivide_width :: MethodBind
bindCubeMesh_get_subdivide_width
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_subdivide_width ::
                      (CubeMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "get_subdivide_width" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CubeMesh.get_subdivide_width

{-# NOINLINE bindCubeMesh_set_size #-}

bindCubeMesh_set_size :: MethodBind
bindCubeMesh_set_size
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_size ::
           (CubeMesh :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "set_size" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.CubeMesh.set_size

{-# NOINLINE bindCubeMesh_set_subdivide_depth #-}

bindCubeMesh_set_subdivide_depth :: MethodBind
bindCubeMesh_set_subdivide_depth
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_subdivide_depth ::
                      (CubeMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "set_subdivide_depth" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CubeMesh.set_subdivide_depth

{-# NOINLINE bindCubeMesh_set_subdivide_height #-}

bindCubeMesh_set_subdivide_height :: MethodBind
bindCubeMesh_set_subdivide_height
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_subdivide_height ::
                       (CubeMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_subdivide_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "set_subdivide_height" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CubeMesh.set_subdivide_height

{-# NOINLINE bindCubeMesh_set_subdivide_width #-}

bindCubeMesh_set_subdivide_width :: MethodBind
bindCubeMesh_set_subdivide_width
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_subdivide_width ::
                      (CubeMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMesh "set_subdivide_width" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CubeMesh.set_subdivide_width